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

# Ejemplos predefinidos
EXAMPLE_1_GRID_DISPLAY="flex"
EXAMPLE_1_FLEX_DIRECTION="row"
EXAMPLE_1_FLEX_WRAP="wrap"
EXAMPLE_1_JUSTIFY_CONTENT="center"
EXAMPLE_1_ALIGN_ITEMS="flex-start"
EXAMPLE_1_ALIGN_CONTENT="space-between"

EXAMPLE_2_GRID_DISPLAY="flex"
EXAMPLE_2_FLEX_DIRECTION="column"
EXAMPLE_2_FLEX_WRAP="wrap"
EXAMPLE_2_JUSTIFY_CONTENT="flex-start"
EXAMPLE_2_ALIGN_ITEMS="center"
EXAMPLE_2_ALIGN_CONTENT="stretch"

EXAMPLE_3_GRID_DISPLAY="inline-flex"
EXAMPLE_3_FLEX_DIRECTION="row"
EXAMPLE_3_FLEX_WRAP="no-wrap"
EXAMPLE_3_JUSTIFY_CONTENT="flex-end"
EXAMPLE_3_ALIGN_ITEMS="center"
EXAMPLE_3_ALIGN_CONTENT="space-around"

EXAMPLE_4_GRID_DISPLAY="inline-flex"
EXAMPLE_4_FLEX_DIRECTION="column"
EXAMPLE_4_FLEX_WRAP="wrap-reverse"
EXAMPLE_4_JUSTIFY_CONTENT="center"
EXAMPLE_4_ALIGN_ITEMS="stretch"
EXAMPLE_4_ALIGN_CONTENT="flex-start"

EXAMPLE_5_GRID_DISPLAY="flex"
EXAMPLE_5_FLEX_DIRECTION="row-reverse"
EXAMPLE_5_FLEX_WRAP="wrap"
EXAMPLE_5_JUSTIFY_CONTENT="space-between"
EXAMPLE_5_ALIGN_ITEMS="flex-start"
EXAMPLE_5_ALIGN_CONTENT="flex-end"

while true; do
  clear
  echo "Seleccione una opción de ejemplo de flexbox:"
  echo "1. Ejemplo 1"
  echo "2. Ejemplo 2"
  echo "3. Ejemplo 3"
  echo "4. Ejemplo 4"
  echo "5. Ejemplo 5"
  echo "6. Personalizar valores"
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
      ;;
    2)
      GRID_DISPLAY="$EXAMPLE_2_GRID_DISPLAY"
      FLEX_DIRECTION="$EXAMPLE_2_FLEX_DIRECTION"
      FLEX_WRAP="$EXAMPLE_2_FLEX_WRAP"
      JUSTIFY_CONTENT="$EXAMPLE_2_JUSTIFY_CONTENT"
      ALIGN_ITEMS="$EXAMPLE_2_ALIGN_ITEMS"
      ALIGN_CONTENT="$EXAMPLE_2_ALIGN_CONTENT"
      ;;
    3)
      GRID_DISPLAY="$EXAMPLE_3_GRID_DISPLAY"
      FLEX_DIRECTION="$EXAMPLE_3_FLEX_DIRECTION"
      FLEX_WRAP="$EXAMPLE_3_FLEX_WRAP"
      JUSTIFY_CONTENT="$EXAMPLE_3_JUSTIFY_CONTENT"
      ALIGN_ITEMS="$EXAMPLE_3_ALIGN_ITEMS"
      ALIGN_CONTENT="$EXAMPLE_3_ALIGN_CONTENT"
      ;;
    4)
      GRID_DISPLAY="$EXAMPLE_4_GRID_DISPLAY"
      FLEX_DIRECTION="$EXAMPLE_4_FLEX_DIRECTION"
      FLEX_WRAP="$EXAMPLE_4_FLEX_WRAP"
      JUSTIFY_CONTENT="$EXAMPLE_4_JUSTIFY_CONTENT"
      ALIGN_ITEMS="$EXAMPLE_4_ALIGN_ITEMS"
      ALIGN_CONTENT="$EXAMPLE_4_ALIGN_CONTENT"
      ;;
    5)
      GRID_DISPLAY="$EXAMPLE_5_GRID_DISPLAY"
      FLEX_DIRECTION="$EXAMPLE_5_FLEX_DIRECTION"
      FLEX_WRAP="$EXAMPLE_5_FLEX_WRAP"
      JUSTIFY_CONTENT="$EXAMPLE_5_JUSTIFY_CONTENT"
      ALIGN_ITEMS="$EXAMPLE_5_ALIGN_ITEMS"
      ALIGN_CONTENT="$EXAMPLE_5_ALIGN_CONTENT"
      ;;
    6)
      get_custom_values
      ;;
    0)
      exit 0
      ;;
    *)
      echo "Opción no válida. Introduce un número válido del menú."
      ;;
  esac

  # Imprimir los valores seleccionados o personalizados
  clear
  echo "Valores seleccionados o personalizados:"
  echo "Tipo de display para div: $GRID_DISPLAY"
  echo "Dirección de los elementos flexibles: $FLEX_DIRECTION"
  echo "Propiedad flex-wrap: $FLEX_WRAP"
  echo "Propiedad justify-content: $JUSTIFY_CONTENT"
  echo "Propiedad align-items: $ALIGN_ITEMS"
  echo "Propiedad align-content: $ALIGN_CONTENT"
  read -n 1 -s -r -p "Presiona cualquier tecla para volver al menú..."
done
