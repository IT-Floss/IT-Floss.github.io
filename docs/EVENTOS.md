---
type: post
title: Creacion de eventos
draft: false
author: Luciano
---


# Eventos de IT Floss
  
Acá vas a poder encontrar documentación para poder crear un evento en el sitio de IT Floss. Se asume que ya leiste nuesto [README](/README.md).
## Indice
- Crear un evento con ifloss CLI
- Crear un evento manualmente || TO BE DONE
-  Crear un evento desde Github || TO BE DONE
- Estructura de datos de un evento
  - Admin Birras
  - Charlas || TO BE DONE

## Crear un evento con itfloss CLI 
```
Usage: itfloss create EVENTO [OPCIONES]
Opciones:
        -h     Imprime esta ayuda por pantalla.
Subcomandos:
        create     Crea nuevo contenido en el sitio.
```
### Admin birras
```
itfloss create adminbirras [OPCIONES]
Opciones:
        -t TITULO    Especifica un titulo para la publicacion        || Default: "Admin Birras!".
        -l LUGAR     Especifica un lugar donde va a ser el evento    || Default: "A confirmar".
        -f FECHA     Especifica una fecha del evento                 || Default: "A confirmar".
        -n NOMBRE    Especifica un nombre para el archivo            || Default: "[MES QUE CORRE].md"
```
Como resultado de la ejecución se creara un archivo con el contenido de una publicacion de admin birras. El archivo de contenido se creara en:

> /path/al/repo/content/eventos/adminbirras-{Nombres del mes}.md

Si ya existe el archivo, la ejecucion saldra con error y el archivo no se creara. Para usar un nombre personalizado
## Crear un evento manualmente || TO BE DONE
## Crear un evento desde Github || TO BE DONE


## Estrucura de datos de un evento
Para especificar los eventos vamos a definir una serie de variables en la cabecera del archivo de contenido del evento que se usaran como parametros para determinar que informacion incluir en la pagina.

#### Parametros de un evento
- fecha: Es la fecha en la que el evento se llevara a cabo - Valor por defecto: "A confirmar"
- lugar:  Es el lugar en la que el evento se llevara a cabo - Valor por defecto: "A confirmar"
- type: evento - **requerido**

### Admin Birras


#### Parametros
Se asumen que los parametros de un evento estan seteados.
- adminBirras: true - **requerido**

Ejemplo :
```
---
title: Admin Birras!
author: Brendan Greg
type: evento
adminBirras: true
date: 2017-06-15T22:52:18+00:00
fecha: Martes 32 de junio a las 25:30 hrs
lugar: La Taberna de Moe - Calle Falsa 123

---
Una nueva iteración de las ya clásicas **#AdminBirras de #Sysarmy @ Rosario!**

El punto de encuentro para los apasionados por la tecnología. Las Birras mas nerds de rosario

No dejen de sumarse a la [Fan Page](https://www.facebook.com/itfloss) y grupo de Facebook

Organizan:
[IT Floss]( http://itfloss.beer) // [Sysarmy](https://sysarmy.com.ar/)

```
### Charlas || TO BE DONE
#### Parametros || TO BE DONE

