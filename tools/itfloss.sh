
################################################################################
## UTILS
################################################################################

asignar_parametro(){
        local KEY=$1
        local VALUE=$2
        local FILE=$3

        sed -i -r "s/^(${KEY}:).*$/\1 ${VALUE}/" $FILE
}

create_adminbirras(){
  # Nombrar el archivo con el nombre del mes que corre
  [[ -z "${NOMBRE_ARCHIVO}" ]] && NOMBRE_ARCHIVO=$(date +%B)

  # Crear adminbirras segun el tipo de archivo definido en archetype/adminbirras.md
  EVENT_FILE_PATH=$(hugo new --kind adminbirras eventos/adminbirras/${NOMBRE_ARCHIVO}.md | awk '{print $2}' | tr -d '"')

  if [[ -f "${EVENT_FILE_PATH}" ]]; then
    # Asignar paramentros  
    [[ -n "${FECHA}" ]] && asignar_parametro "fecha" "${FECHA}" "${EVENT_FILE_PATH}"
    [[ -n "${TITULO}" ]] && asignar_parametro "title" "${TITULO}" "${EVENT_FILE_PATH}"
    [[ -n "${LUGAR}" ]] && asignar_parametro "lugar" "${LUGAR}" "${EVENT_FILE_PATH}"

    # Publicar
    asignar_parametro "draft" "false" "${EVENT_FILE_PATH}"
  else
    echo "EL Evento no se pudo crear"
    exit 1
  fi
  
  echo "El evento se creo satisfactoriamente:"
  echo "PATH: ${EVENT_FILE_PATH}"
  cat $EVENT_FILE_PATH
}

################################################################################
## USAGE
################################################################################
usage_itfloss()
{
   echo "Usage: itfloss create adminbirras [OPCIONES]

Opciones:
        -t TITULO    Especifica un titulo para la publicacion        || Default: "Admin Birras!".
        -l LUGAR     Especifica un lugar donde va a ser el evento    || Default: "A confirmar".
        -f FECHA     Especifica una fecha del evento                 || Default: "A confirmar".
        -n NOMBRE    Especifica un nombre para el archivo            || Default: "[MES QUE CORRE].md"
	-h           Imprime esta ayuda por pantalla.
   "
   exit 0
}


usage_itfloss_create_adminbirras(){

   echo "Usage: itfloss create adminbirras [OPCIONES]

Opciones:
        -t TITULO    Especifica un titulo para la publicacion        || Default: "Admin Birras!".
        -l LUGAR     Especifica un lugar donde va a ser el evento    || Default: "A confirmar".
        -f FECHA     Especifica una fecha del evento                 || Default: "A confirmar".
        -n NOMBRE    Especifica un nombre para el archivo            || Default: "[MES QUE CORRE].md"
	-h     	     Imprime esta ayuda por pantalla.
   "
   exit 0
}


################################################################################
## MAIN 
################################################################################

# Procesar opciones del comando itfloss
while getopts ":h" opt; do
  case ${opt} in
    h ) usage_itfloss
      ;;
   \? )
     echo "Option invalida: -$OPTARG" 1>&2
     exit 1
     ;;
  esac
done
shift $((OPTIND -1))

SUBCOMMAND=$1; shift  # Removemos 'itfloss' de la lista de argumentos
case "$SUBCOMMAND" in
  # Parsear subcomandos del comando itfloss
  create)
    # Removemos 'create' de la lista de argumentos
    SUBCOMMAND=$1; shift  

    # Parsear subcomandos del comando create
    case "$SUBCOMMAND" in
      adminbirras)
        # Procesa optiones del subcomando adminbirras
        while getopts "l:t:f:n:h" opt; do
          case ${opt} in
            l ) LUGAR=$OPTARG ;;
            f ) FECHA=$OPTARG ;;
            t ) TITULO=$OPTARG ;;
	    n ) NOMBRE_ARCHIVO=$OPTARG ;;
	    h) usage_itfloss_create_adminbirras; exit 0;;
            \? )
              echo "Option invalida: -$OPTARG" 1>&2
              exit 1
              ;;
            : )
              echo "La opcion -$OPTARG requiere un argumento" 1>&2
              exit 1
              ;;
          esac
        done
        shift $((OPTIND -1))
        create_adminbirras ;;

      *) echo "Subcommando invalido: ${SUBCOMMAND}";;
    esac
  ;;
esac


