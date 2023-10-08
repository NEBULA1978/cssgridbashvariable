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
  grid-template-rows: repeat($GRID_ROWS, 1fr);
  grid-template-columns: repeat($GRID_COLUMNS, 1fr);
  grid-gap: $GRID_GAP;
  height: 300px;
  border: 1px solid black;
}

.grid-item {
  width: 100px;
  height: 100px;
  background-color: lightgray;
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

# Función para modificar el número de filas
modify_rows() {
  echo "Introduce el nuevo número de filas:"
  read -r GRID_ROWS
  generate_html
}

# Función para modificar el número de columnas
modify_columns() {
  echo "Introduce el nuevo número de columnas:"
  read -r GRID_COLUMNS
  generate_html
}

while true; do
  clear
  echo "Menú de Ejemplos de CSS Grid:"
  echo "1. Ver cuadrícula de 2x2"
  echo "2. Ver cuadrícula de 3x3"
  echo "3. Ver cuadrícula de 4x4"
  echo "4. Personalizar valores de la cuadrícula"
  echo "5. Modificar número de filas"
  echo "6. Modificar número de columnas"
  echo "7. Otra opción adicional"
  echo "8. Otra opción adicional 2"
  echo "9. Salir"

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
      modify_rows
      ;;

    6)
      modify_columns
      ;;

    7)
      echo "Has seleccionado la opción 7."
      # Agrega aquí la acción que deseas para la opción 7
      
      ;;

    8)
      echo "Has seleccionado la opción 8."
      # Agrega aquí la acción que deseas para la opción 8

      ;;

    9)
      exit 0
      ;;

    *)
      echo "Opción inválida. Introduce un número del 1 al 9."
      ;;
  esac

  echo "Archivo HTML generado como 'grid_example.html'. Presiona Enter para continuar."
  read -r
done
