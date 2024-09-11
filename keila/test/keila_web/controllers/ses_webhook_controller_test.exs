defmodule KeilaWeb.SESWebhookControllerTest do
  use KeilaWeb.ConnCase, async: false

  @message_id "0107017cda9fa5c6-be6757c7-8954-4f49-bea4-259cb6e602de-000000"
  @aws_key "SimpleNotificationService-7ff5318490ec183fbaddaa2a969abfda.pem"

  setup do
    _root = insert!(:group)
    user = insert!(:user)
    {:ok, project} = Keila.Projects.create_project(user.id, params(:project))

    # Add AWS key to cache because otherwise test data might go stale when
    # AWS cycles keys
    Path.join(:code.priv_dir(:keila), "vendor/aws/#{@aws_key}")
    |> File.read!()
    |> Keila.Mailings.SenderAdapters.SES.extract_key()
    |> then(fn key ->
      Keila.Mailings.SenderAdapters.SES.put_cached_key(
        "https://sns.eu-central-1.amazonaws.com/#{@aws_key}",
        key
      )
    end)

    %{project: project}
  end

  @tag :ses_webhook_controller
  test "handle bounces from SES", %{conn: conn, project: project} do
    contact = insert!(:contact, project_id: project.id)
    campaign = insert!(:mailings_campaign, project_id: project.id)

    recipient =
      insert!(:mailings_recipient,
        contact_id: contact.id,
        campaign_id: campaign.id,
        receipt: @message_id
      )

    data = File.read!("test/keila/mailings/ses/bounce.signed.json")

    conn =
      conn
      |> put_req_header("content-type", "text/plain; charset=UTF-8")
      |> post(Routes.ses_webhook_path(conn, :webhook), data)

    assert 200 == conn.status

    assert %{status: :unreachable} = Keila.Repo.get(Keila.Contacts.Contact, recipient.contact_id)
  end

  @tag :ses_webhook_controller
  @tag :skip
  # This test is not suitable for running as part of the test suite but
  # is part of this file to document how the SNS Subscription feature can be
  # tested
  test "subscription_created webhook", %{conn: conn} do
    data = File.read!("test/keila/mailings/ses/subscription.signed.json")

    conn =
      conn
      |> put_req_header("content-type", "text/plain; charset=UTF-8")
      |> post(Routes.ses_webhook_path(conn, :webhook), data)

    assert 200 == conn.status
  end
end
