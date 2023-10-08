#!/bin/bash

# Función para solicitar valores personalizados
get_custom_values() {
  echo "Introduce el tipo de display para div (por ejemplo, 'flex', 'block', etc.):"
  read -r GRID_DISPLAY

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

# Función para generar el archivo HTML con CSS personalizado
generate_html() {
  cat <<EOF >flexbox_example.html
<!DOCTYPE html>
<html>
<head>
<style>
.flex-container {
  display: $GRID_DISPLAY;
  flex-direction: $FLEX_DIRECTION;
  flex-wrap: $FLEX_WRAP;
  justify-content: $JUSTIFY_CONTENT;
  align-items: $ALIGN_ITEMS;
  align-content: $ALIGN_CONTENT;
  height: 300px; /* Ajusta la altura según sea necesario */
  border: 1px solid black; /* Agrega un borde para visualizar el contenedor */
}

.flex-item {
  width: 100px; /* Ancho de los elementos flexibles */
  height: 100px; /* Altura de los elementos flexibles */
  margin: 10px; /* Márgenes entre los elementos flexibles */
  background-color: lightgray; /* Color de fondo de los elementos */
}
</style>
</head>
<body>
<div class="flex-container">
  <div class="flex-item">1</div>
  <div class="flex-item">2</div>
  <div class="flex-item">3</div>
</div>
</body>
</html>
EOF
}

while true; do
  clear
  echo "Menú de Ejemplos de Flexbox:"
  echo "1. Ejemplo de Flexbox con dirección 'row'"
  echo "   - Elementos colocados horizontalmente de izquierda a derecha."
  echo "2. Ejemplo de Flexbox con dirección 'row-reverse'"
  echo "   - Elementos colocados horizontalmente de derecha a izquierda."
  echo "3. Ejemplo de Flexbox con dirección 'column'"
  echo "   - Elementos colocados verticalmente de arriba abajo."
  echo "4. Ejemplo de Flexbox con dirección 'column-reverse'"
  echo "   - Elementos colocados verticalmente de abajo arriba."
  echo "5. Ejemplo de Flexbox con personalización de valores"
  echo "   - Puedes configurar los valores de Flexbox a tu elección."
  echo "0. Salir"

  read -r OPTION
  case $OPTION in
    1)
      GRID_DISPLAY="$EXAMPLE_1_GRID_DISPLAY"
      FLEX_DIRECTION="$EXAMPLE_1_FLEX_DIRECTION"
      FLEX_WRAP="$EXAMPLE_1_FLEX_WRAP"
      JUSTIFY_CONTENT="$EXAMPLE_1_JUSTIFY_CONTENT"
      ALIGN_ITEMS="$EXAMPLE_1_ALIGN_ITEMS"
      ALIGN_CONTENT="$EXAMPLE_1_ALIGN_CONTENT"
      generate_html # Llamar a la función para generar HTML
      ;;
    2)
      GRID_DISPLAY="$EXAMPLE_2_GRID_DISPLAY"
      FLEX_DIRECTION="$EXAMPLE_2_FLEX_DIRECTION"
      FLEX_WRAP="$EXAMPLE_2_FLEX_WRAP"
      JUSTIFY_CONTENT="$EXAMPLE_2_JUSTIFY_CONTENT"
      ALIGN_ITEMS="$EXAMPLE_2_ALIGN_ITEMS"
      ALIGN_CONTENT="$EXAMPLE_2_ALIGN_CONTENT"
      generate_html # Llamar a la función para generar HTML
      ;;
    3)
      GRID_DISPLAY="$EXAMPLE_3_GRID_DISPLAY"
      FLEX_DIRECTION="$EXAMPLE_3_FLEX_DIRECTION"
      FLEX_WRAP="$EXAMPLE_3_FLEX_WRAP"
      JUSTIFY_CONTENT="$EXAMPLE_3_JUSTIFY_CONTENT"
      ALIGN_ITEMS="$EXAMPLE_3_ALIGN_ITEMS"
      ALIGN_CONTENT="$EXAMPLE_3_ALIGN_CONTENT"
      generate_html # Llamar a la función para generar HTML
      ;;
    4)
      GRID_DISPLAY="$EXAMPLE_4_GRID_DISPLAY"
      FLEX_DIRECTION="$EXAMPLE_4_FLEX_DIRECTION"
      FLEX_WRAP="$EXAMPLE_4_FLEX_WRAP"
      JUSTIFY_CONTENT="$EXAMPLE_4_JUSTIFY_CONTENT"
      ALIGN_ITEMS="$EXAMPLE_4_ALIGN_ITEMS"
      ALIGN_CONTENT="$EXAMPLE_4_ALIGN_CONTENT"
      generate_html # Llamar a la función para generar HTML
      ;;
    5)
      GRID_DISPLAY="$EXAMPLE_5_GRID_DISPLAY"
      FLEX_DIRECTION="$EXAMPLE_5_FLEX_DIRECTION"
      FLEX_WRAP="$EXAMPLE_5_FLEX_WRAP"
      JUSTIFY_CONTENT="$EXAMPLE_5_JUSTIFY_CONTENT"
      ALIGN_ITEMS="$EXAMPLE_5_ALIGN_ITEMS"
      ALIGN_CONTENT="$EXAMPLE_5_ALIGN_CONTENT"
      generate_html # Llamar a la función para generar HTML
      ;;
    6)
      get_custom_values
      generate_html # Llamar a la función para generar HTML
      ;;
    0)
      exit 0
      ;;
    *)
      echo "Opción no válida. Introduce un número válido del menú."
      ;;
  esac

  echo "Archivo HTML generado con las configuraciones seleccionadas o personalizadas. Puedes encontrarlo en flexbox_example.html."
  read -n 1 -s -r -p "Presiona cualquier tecla para volver al menú..."
done
