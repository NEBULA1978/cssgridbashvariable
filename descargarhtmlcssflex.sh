#!/bin/bash

# Descargar la página web en un archivo temporal
curl -o ejemplos_css.html https://www.mclibre.org/consultar/htmlcss/css/css-flexbox.html

# Menú principal
while true; do
    clear
    echo "Menú de filtros:"
    echo "1. Mostrar nombres de secciones con ejemplos"
    echo "2. Otro filtro (agrega aquí tu filtro adicional)"
    echo "3. Salir"
    read -p "Seleccione una opción: " opcion

    case $opcion in
        1)
            # Filtrar y mostrar nombres de secciones con ejemplos
            awk -F '[<>]' '/<h2 class="con-aside>/{print $5}' ejemplos_css.html
            ;;
        2)
            # Agrega aquí tu filtro adicional
            # Puedes usar 'grep', 'awk', u otras herramientas según tu necesidad
            ;;
        3)
            # Salir del script
            echo "Saliendo del script."
            exit 0
            ;;
        *)
            echo "Opción no válida. Por favor, seleccione una opción válida."
            ;;
    esac

    read -p "Presione Enter para continuar..."
done
