# Proyecto Elixir DevOps Test

Este proyecto demuestra la configuración y despliegue de una aplicación Elixir utilizando Terraform, Kubernetes y AWS.

## Estructura del proyecto

### Workflows
```
├───.github
│   └───workflows
│           deploy.yaml
│           generateKey.yaml
```
En esta carpeta se alojan los workflows de GitHub Actions, que habilitan el repositorio para desplegar y mantener al día nuestra infraestructura.

#### Generar llave secreta

Para generar una llave secreta, se debe ejecutar el workflow `Generate secret key`, el cual se encargará de generar una llave y esta llave se debe guardar en el repositorio como un secreto. (Utilitario para poder crear la llave en el repositorio y no en local. Deberia hacerse local pero por motivos de facilidad se hace en el workflow)

### Desplegar infraestructura IaC

```
└───Terraform
    │   main.tf
    │   output.tf
    │   terraform.tfvars
    │   variables.tf
    └───modules
        ├───eks
        │       main.tf
        │       output.tf
        │       variables.tf
        ├───iam
        │       main.tf
        │       output.tf
        │       variables.tf
        ├───rds
        │       main.tf
        │       output.tf
        │       variables.tf
        └───vpc
                data_sources.tf
                main.tf
                output.tf
                variables.tf
```
Esta carpeta contiene los archivos de Terraform para la infraestructura de AWS. Creacion del cluster EKS, VPC, Subnets, IAM polices.
### Aplicación Keila

```
└───keila
    └───ops
        ├───kubernetes
        │       deployment.yml
        │       service.yml
        │       ingress.yml
        │       secret.yml
        └   Dockerfile
    │   Contenido de la aplicación
```
Esta carpeta contiene la aplicación Keila - An Open Source Newsletter Tool, la cual se despliega en el cluster EKS.