#!/bin/bash

# Función para solicitar valores personalizados
get_custom_values() {
  echo "Introduce el número de filas:"
  read -r GRID_ROWS

  echo "Introduce el número de columnas:"
  read -r GRID_COLUMNS

  echo "Introduce el espacio entre las celdas (por ejemplo, '5px', '10px', etc.):"
  read -r GRID_GAP
}

# Función para generar el archivo HTML con CSS Grid personalizado
generate_html() {
  cat <<EOF >grid_example.html
<!DOCTYPE html>
<html>
<head>
<style>
.grid-container {
  display: grid;
  grid-template-rows: repeat($GRID_ROWS, 1fr); /* Configura el número de filas */
  grid-template-columns: repeat($GRID_COLUMNS, 1fr); /* Configura el número de columnas */
  grid-gap: $GRID_GAP; /* Configura el espacio entre las celdas */
  height: 300px; /* Ajusta la altura según sea necesario */
  border: 1px solid black; /* Agrega un borde para visualizar el contenedor */
}

.grid-item {
  width: 100px; /* Ancho de los elementos de la cuadrícula */
  height: 100px; /* Altura de los elementos de la cuadrícula */
  background-color: lightgray; /* Color de fondo de los elementos */
}
</style>
</head>
<body>
<div class="grid-container">
EOF

  for ((i = 1; i <= GRID_ROWS * GRID_COLUMNS; i++)); do
    echo "  <div class=\"grid-item\">$i</div>" >>grid_example.html
  done

  cat <<EOF >>grid_example.html
</div>
</body>
</html>
EOF
}

while true; do
  clear
  echo "Menú de Ejemplos de CSS Grid:"
  echo "1. Ver cuadrícula de 2x2"
  echo "2. Ver cuadrícula de 3x3"
  echo "3. Ver cuadrícula de 4x4"
  echo "4. Personalizar valores de la cuadrícula"
  echo "5. Otra opción adicional"
  echo "6. Otra opción adicional 2"
  echo "7. Salir"

  read -n 1 -r OPTION
  echo ""  # Agrega un salto de línea para que la siguiente salida no se mezcle

  case $OPTION in
    1)
      GRID_ROWS=2
      GRID_COLUMNS=2
      GRID_GAP="5px"
      generate_html
      ;;

    2)
      GRID_ROWS=3
      GRID_COLUMNS=3
      GRID_GAP="10px"
      generate_html
      ;;

    3)
      GRID_ROWS=4
      GRID_COLUMNS=4
      GRID_GAP="15px"
      generate_html
      ;;

    4)
      get_custom_values
      generate_html
      ;;

    5)
      echo "Has seleccionado la opción 5."
      # Agrega aquí la acción que deseas para la opción 5
      
      ;;

    6)
      echo "Has seleccionado la opción 6."
      # Agrega aquí la acción que deseas para la opción 6

      ;;

    7)
      exit 0
      ;;

    *)
      echo "Opción inválida. Introduce un número del 1 al 7."
      ;;
  esac

  echo "Archivo HTML generado como 'grid_example.html'. Presiona Enter para continuar."
  read -r
done
