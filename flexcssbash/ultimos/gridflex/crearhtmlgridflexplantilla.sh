#!/bin/bash

# Función para solicitar valores personalizados de CSS Grid
get_custom_grid_values() {
  echo "Introduce el número de filas:"
  read -r GRID_ROWS

  echo "Introduce el número de columnas:"
  read -r GRID_COLUMNS

  echo "Introduce el espacio entre las celdas (por ejemplo, '5px', '10px', etc.):"
  read -r GRID_GAP
}

# Función para generar el archivo HTML con CSS Grid personalizado
generate_grid_html() {
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
  height: 100%; /* Cambiamos la altura al 100% para que se ajuste automáticamente al contenido */
  border: 1px solid black;
}

.grid-item {
  width: 100%;
  height: 100%;
  background-color: lightgray;
  display: flex;
  flex-direction: column;
  border: 1px solid black; /* Agregamos un borde a las cajas */
}

.header {
  background-color: lightblue;
  height: 10%;
}

.aside {
  background-color: lightgreen;
  flex-grow: 1;
}

.main {
  background-color: lightyellow;
  flex-grow: 3;
}

.nav {
  background-color: lightpink;
  height: 10%;
}

.footer {
  background-color: lightsalmon;
  height: 10%;
}
</style>
</head>
<body>
<div class="grid-container">
EOF

  for ((i = 1; i <= GRID_ROWS * GRID_COLUMNS; i++)); do
    echo "  <div class=\"grid-item\">"
    echo "    <div class=\"header\">Header $i</div>"
    echo "    <div class=\"aside\">Aside $i</div>"
    echo "    <div class=\"main\">Main $i</div>"
    echo "    <div class=\"nav\">Nav $i</div>"
    echo "    <div class=\"footer\">Footer $i</div>"
    echo "  </div>" >>grid_example.html
  done

  cat <<EOF >>grid_example.html
</div>
</body>
</html>
EOF
}

# Función para modificar el número de filas de CSS Grid
modify_grid_rows() {
  echo "Introduce el nuevo número de filas:"
  read -r GRID_ROWS
  generate_grid_html
}

# Función para modificar el número de columnas de CSS Grid
modify_grid_columns() {
  echo "Introduce el nuevo número de columnas:"
  read -r GRID_COLUMNS
  generate_grid_html
}

# Función para solicitar valores personalizados de Flexbox
get_custom_flex_values() {
  echo "Introduce el tipo de display para div (por ejemplo, 'flex', 'block', 'inline-flex', etc.):"
  read -r FLEX_DISPLAY

  echo "Introduce la dirección de los elementos flexibles ('row', 'row-reverse', 'column', 'column-reverse'):"
  read -r FLEX_DIRECTION

  echo "Introduce la propiedad flex-wrap ('no-wrap', 'wrap', 'wrap-reverse'):"
  read -r FLEX_WRAP

  echo "Introduce la propiedad justify-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around'):"
  read -r JUSTIFY_CONTENT

  echo "Introduce la propiedad align-items ('flex-start', 'flex-end', 'center', 'stretch', 'baseline'):"
  read -r ALIGN_ITEMS

  echo "Introduce la propiedad align-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch'):"
  read -r ALIGN_CONTENT
}

# Función para generar el archivo HTML con CSS Flexbox personalizado
generate_flex_html() {
  cat <<EOF >flexbox_example.html
<!DOCTYPE html>
<html>
<head>
<style>
.flex-container {
  display: $FLEX_DISPLAY;
  flex-direction: $FLEX_DIRECTION;
  flex-wrap: $FLEX_WRAP;
  justify-content: $JUSTIFY_CONTENT;
  align-items: $ALIGN_ITEMS;
  align-content: $ALIGN_CONTENT;
  height: 100%; /* Cambiamos la altura al 100% para que se ajuste automáticamente al contenido */
  border: 1px solid black;
}

.flex-item {
  width: 100%;
  height: 100%;
  margin: 10px;
  background-color: lightgray;
  display: flex;
  flex-direction: column;
  border: 1px solid black; /* Agregamos un borde a las cajas */
}

.header {
  background-color: lightblue;
  height: 10%;
}

.aside {
  background-color: lightgreen;
  flex-grow: 1;
}

.main {
  background-color: lightyellow;
  flex-grow: 3;
}

.nav {
  background-color: lightpink;
  height: 10%;
}

.footer {
  background-color: lightsalmon;
  height: 10%;
}
</style>
</head>
<body>
<div class="flex-container">
  <div class="flex-item">
    <div class="header">Header 1</div>
    <div class="aside">Aside 1</div>
    <div class="main">Main 1</div>
    <div class="nav">Nav 1</div>
    <div class="footer">Footer 1</div>
  </div>
  <div class="flex-item">
    <div class="header">Header 2</div>
    <div class="aside">Aside 2</div>
    <div class="main">Main 2</div>
    <div class="nav">Nav 2</div>
    <div class="footer">Footer 2</div>
  </div>
  <div class="flex-item">
    <div class="header">Header 3</div>
    <div class="aside">Aside 3</div>
    <div class="main">Main 3</div>
    <div class="nav">Nav 3</div>
    <div class="footer">Footer 3</div>
  </div>
  <div class="flex-item">
    <div class="header">Header 4</div>
    <div class="aside">Aside 4</div>
    <div class="main">Main 4</div>
    <div class="nav">Nav 4</div>
    <div class="footer">Footer 4</div>
  </div>
  <div class="flex-item">
    <div class="header">Header 5</div>
    <div class="aside">Aside 5</div>
    <div class="main">Main 5</div>
    <div class="nav">Nav 5</div>
    <div class="footer">Footer 5</div>
  </div>
</div>
</body>
</html>
EOF
}

while true; do
  clear
  echo "Menú de Ejemplos de CSS:"
  echo "1. Ejemplo de CSS Grid"
  echo "2. Ejemplo de Flexbox"
  echo "3. Salir"

  read -n 1 -r OPTION
  echo ""  # Agrega un salto de línea para que la siguiente salida no se mezcle

  case $OPTION in
    1)
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
      echo "9. Volver al menú principal"

      read -n 1 -r GRID_OPTION
      echo ""  # Agrega un salto de línea para que la siguiente salida no se mezcle

      case $GRID_OPTION in
        1)
          GRID_ROWS=2
          GRID_COLUMNS=2
          GRID_GAP="5px"
          generate_grid_html
          ;;

        2)
          GRID_ROWS=3
          GRID_COLUMNS=3
          GRID_GAP="10px"
          generate_grid_html
          ;;

        3)
          GRID_ROWS=4
          GRID_COLUMNS=4
          GRID_GAP="15px"
          generate_grid_html
          ;;

        4)
          get_custom_grid_values
          generate_grid_html
          ;;

        5)
          modify_grid_rows
          ;;

        6)
          modify_grid_columns
          ;;

        7)
          echo "Has seleccionado la opción 7 para CSS Grid."
          # Agrega aquí la acción que deseas para la opción 7 de CSS Grid
          ;;

        8)
          echo "Has seleccionado la opción 8 para CSS Grid."
          # Agrega aquí la acción que deseas para la opción 8 de CSS Grid
          ;;

        9)
          # Regresar al menú principal
          continue
          ;;

        *)
          echo "Opción inválida. Introduce un número del 1 al 9."
          ;;
      esac

      echo "Archivo HTML generado como 'grid_example.html'. Presiona Enter para continuar."
      read -r
      ;;

    2)
      clear
      echo "Menú de Ejemplos de Flexbox:"
      echo "1. Ejemplo de Flexbox con dirección 'row'"
      echo "2. Ejemplo de Flexbox con dirección 'row-reverse'"
      echo "3. Ejemplo de Flexbox con dirección 'column'"
      echo "4. Ejemplo de Flexbox con dirección 'column-reverse'"
      echo "5. Ejemplo de Flexbox con personalización de valores"
      echo "6. Ejemplo de Flexbox con display 'inline-flex'"
      echo "7. Otra opción adicional"
      echo "8. Otra opción adicional 2"
      echo "9. Volver al menú principal"

      read -n 1 -r FLEX_OPTION
      echo ""  # Agrega un salto de línea para que la siguiente salida no se mezcle

      case $FLEX_OPTION in
        1)
          FLEX_DISPLAY="flex"
          FLEX_DIRECTION="row"
          FLEX_WRAP="nowrap"
          JUSTIFY_CONTENT="flex-start"
          ALIGN_ITEMS="stretch"
          ALIGN_CONTENT="flex-start"
          generate_flex_html
          ;;

        2)
          FLEX_DISPLAY="flex"
          FLEX_DIRECTION="row-reverse"
          FLEX_WRAP="nowrap"
          JUSTIFY_CONTENT="flex-start"
          ALIGN_ITEMS="stretch"
          ALIGN_CONTENT="flex-start"
          generate_flex_html
          ;;

        3)
          FLEX_DISPLAY="flex"
          FLEX_DIRECTION="column"
          FLEX_WRAP="nowrap"
          JUSTIFY_CONTENT="flex-start"
          ALIGN_ITEMS="stretch"
          ALIGN_CONTENT="flex-start"
          generate_flex_html
          ;;

        4)
          FLEX_DISPLAY="flex"
          FLEX_DIRECTION="column-reverse"
          FLEX_WRAP="nowrap"
          JUSTIFY_CONTENT="flex-start"
          ALIGN_ITEMS="stretch"
          ALIGN_CONTENT="flex-start"
          generate_flex_html
          ;;

        5)
          get_custom_flex_values
          generate_flex_html
          ;;

        6)
          FLEX_DISPLAY="inline-flex"
          FLEX_DIRECTION="row"
          FLEX_WRAP="nowrap"
          JUSTIFY_CONTENT="flex-start"
          ALIGN_ITEMS="stretch"
          ALIGN_CONTENT="flex-start"
          generate_flex_html
          ;;

        7)
          echo "Has seleccionado la opción 7 para Flexbox."
          # Agrega aquí la acción que deseas para la opción 7 de Flexbox
          ;;

        8)
          echo "Has seleccionado la opción 8 para Flexbox."
          # Agrega aquí la acción que deseas para la opción 8 de Flexbox
          ;;

        9)
          # Regresar al menú principal
          continue
          ;;

        *)
          echo "Opción inválida. Introduce un número del 1 al 9."
          ;;
      esac

      echo "Archivo HTML generado como 'flexbox_example.html'. Presiona Enter para continuar."
      read -r
      ;;

    3)
      exit 0
      ;;

    *)
      echo "Opción inválida. Introduce un número del 1 al 3."
      ;;
  esac
done
