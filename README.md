# MovieAlten

Foobar es una app para Alten donde se demuestran las competencias como desarrollador de ios del propietario.

## Instalación

Para instalar la aplicación se necesita clonar el proyecto público desde esta dirección: https://github.com/SergioMunozGomez1996/MovieAlten.git. Este proceso se puede realizar desde el sistema de versiones del propio Xcode o descargando y abriendo el proyecto en local.


## Herramientas y lenguajes utilizados

Para el desarrollo de este proyecto se han utilizado las siguientes herramientas:

- Xcode (version 13.2.1)
- SwiftUI y Combine como framework para el diseño de interfaces.
- Swift como lenguage de programación.
- Alamofire (version 5.5.0) como framwork para el trabajo con las llamadas a API y la gestión de sus respuestas.

## Arquitectura
El proyecto se ha llevado a cabo siguiendo el modelo de arquitectura MVVM donde se divide el código en clases de datos que interactúan con las vistas. De esta manera se consigue una estructura limpia, escalable y modularizable.

## Otras consideraciones
Debido a que el proyecto ha sido escrito usando SwiftUI, al ser éste un lenguaje muy nuevo, aún hay aspectos que requieren de UIKit para su implementación, por eso hay algunas referencias del antiguo framework en el código.
