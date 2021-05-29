# How to collab

*   Fork del repositorio
*   Clonar el fork del repositorio
*   Actualizar la rama master
*   Hacer los cambios
*   Hacer un Pull Request

## Fork del repositorio

El primer paso es hacer "Fork" del repositorio.

## Clonar el repositorio

Después de tener el repositorio en nuestra cuenta, seleccionar la dirección del repositorio "SSH o HTTP" y clonar:

`$ git clone --recurse-submodules https://github.com/IT-Floss/IT-Floss.github.io.git`

## Hacer cambios

Realizar todos los cambios que se desea hacer al proyecto.

Agregar los archivos y hacer un commit

`$ git commit -am "De esto van mis cambios" `

Después de realizar el commit hacer el push hacia nuestro repositorio indicando la rama que hemos creado.

`$ git push`

## Probar cambios

### en local

Para esto es necesario tener hugo instalado (apt install hugo)
Dentro del repositorio clonado, corrr hugo server

`$ hugo server --baseURL localhost`

o si desarrollan en un remoto:
`$ hugo server --bind <ip o hostname> --baseURL <ip o hostname>`

Cada vez que realicen un cambio a hugo se va a encargar de redenderizar el sitio.

### en su github pages. 

El sitio funciona con Github Pages, hugo y github actions. Lo que significa que, con una cuenta de github, tienen todo lo que necesitan para testear. 

Deberia quedar todo automaticamente seteado al forkear el repositorio, quedando publicado en usuario.github.io/IT-Floss.github.io/ . Aun no pudimos resolver un pequeño detalle con el baseURL en este caso, por lo que notaran que los enlaces quedan armados con itfloss.beer

## Hacer un Pull Request

Una vez que estan conformes con sus cambios y desean que sean considerados para ser integrados en el sitio, debe realizar un Pull request.

En su repo forkeado click en "Compare & Pull Request" para crear el pull request. 

Escribir cambios del Pull Request.

Si todo está bien, enviar con el botón "Send Pull Request".

Esperar a que el dueño del repositorio lo revise, acepte y mezcle en la rama correspondiente.

## Tools
- https://gohugo.io/variables/page/
- https://dillinger.io/
- https://github.com/mundimark/awesome-markdown-editors
- https://github.com/SohanChy/Lipi- 


