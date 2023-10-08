#!/bin/bash

# Valores por defecto para la sección de cuadrícula
GRID_DISPLAY="grid"
GRID_COLUMNS="auto-fit"
GRID_MINMAX="100px, 1fr"
GRID_GAP="5px"
GRID_WIDTH="100px"
GRID_HEIGHT="100px"
GRID_ITEM_COUNT=10
GRID_BACKGROUND_COLOR="grey"
GRID_TEXT_COLOR="black"
GRID_BORDER_COLOR="black"
GRID_BORDER_WIDTH="5px"
GRID_JUSTIFY_ITEMS="center"
GRID_ALIGN_ITEMS="center"
GRID_TEXT_ALIGN="center"
GRID_ITEM_INPUT_TAG="div"
GRID_ITEM_INPUT_CLASS="grid-item-input"
GRID_CONTAINER_CLASS="grid-container"

# Valores por defecto para la sección de flexbox
FLEX_DISPLAY="flex"
FLEX_DIRECTION="row"
FLEX_WRAP="wrap"
FLEX_JUSTIFY_CONTENT="center"
FLEX_ALIGN_ITEMS="center"
FLEX_TEXT_ALIGN="center"  # Nueva variable para text-align en la sección de flexbox

# Opciones de CSS predefinidas
DISPLAY_OPTIONS=("grid")
CSS_OPTIONS=("auto-fit auto-fill 2 3 4 1fr 2fr 3fr start end center stretch")
JUSTIFY_ITEMS_OPTIONS=("start end center stretch")
ALIGN_ITEMS_OPTIONS=("start end center stretch")

# Función para validar las opciones del usuario
validate_option() {
  local options_array="$1"
  local user_input="$2"
  local default_value="$3"

  if [[ ! " ${options_array[*]} " =~  ${user_input}  ]]; then
    echo "Opción no válida. Utilizando valor por defecto: $default_value."
    user_input="$default_value"
  fi

  echo "$user_input"
}

while true; do
  echo "¿Deseas utilizar valores por defecto o introducir valores personalizados? (defecto/personalizados/salir):"
  read -r choice

  case $choice in
    "defecto")
      # Usar valores por defecto
      break
      ;;
    "personalizados")
      # Solicitar valores personalizados
      echo "Introduce el tipo de display para la sección de cuadrícula (opciones disponibles: ${DISPLAY_OPTIONS[*]}):"
      read -r GRID_DISPLAY
      GRID_DISPLAY=$(validate_option "${DISPLAY_OPTIONS[*]}" "$GRID_DISPLAY" "grid")

      echo "Introduce el número de columnas de la cuadrícula (opciones disponibles: ${CSS_OPTIONS[*]}):"
      read -r GRID_COLUMNS
      GRID_COLUMNS=$(validate_option "${CSS_OPTIONS[*]}" "$GRID_COLUMNS" "auto-fit")

      echo "Introduce la alineación horizontal de los elementos de la cuadrícula (opciones disponibles: ${JUSTIFY_ITEMS_OPTIONS[*]}):"
      read -r GRID_JUSTIFY_ITEMS
      GRID_JUSTIFY_ITEMS=$(validate_option "${JUSTIFY_ITEMS_OPTIONS[*]}" "$GRID_JUSTIFY_ITEMS" "center")

      echo "Introduce la alineación vertical de los elementos de la cuadrícula (opciones disponibles: ${ALIGN_ITEMS_OPTIONS[*]}):"
      read -r GRID_ALIGN_ITEMS
      GRID_ALIGN_ITEMS=$(validate_option "${ALIGN_ITEMS_OPTIONS[*]}" "$GRID_ALIGN_ITEMS" "center")

      echo "Introduce la alineación del texto de los elementos de la cuadrícula (opciones disponibles: left, right, center, justify):"
      read -r GRID_TEXT_ALIGN
      GRID_TEXT_ALIGN=$(validate_option "left right center justify" "$GRID_TEXT_ALIGN" "center")

      echo "Introduce la etiqueta HTML para los elementos de la cuadrícula (por ejemplo, 'div', 'span', etc.):"
      read -r GRID_ITEM_INPUT_TAG

      echo "¿Deseas utilizar flexbox en lugar de cuadrícula para la sección de cuadrícula? (si/no):"
      read  -r use_flexbox

      if [[ $use_flexbox == "si" ]]; then
        echo "Introduce el tipo de display para la sección de flexbox (opciones disponibles: flex, inline-flex):"
        read -r FLEX_DISPLAY

        echo "Introduce la dirección de flex para la sección de flexbox (opciones disponibles: row, row-reverse, column, column-reverse):"
        read -r FLEX_DIRECTION

        echo "Introduce el wrap de flex para la sección de flexbox (opciones disponibles: wrap, nowrap, wrap-reverse):"
        read -r FLEX_WRAP

        echo "Introduce la alineación horizontal de flex para la sección de flexbox (opciones disponibles: flex-start, flex-end, center, space-between, space-around, space-evenly):"
        read -r FLEX_JUSTIFY_CONTENT

        echo "Introduce la alineación vertical de flex para la sección de flexbox (opciones disponibles: flex-start, flex-end, center, baseline, stretch):"
        read -r FLEX_ALIGN_ITEMS

        echo "Introduce la alineación del texto de los elementos de la sección de flexbox (opciones disponibles: left, right, center, justify):"
        read -r FLEX_TEXT_ALIGN
        FLEX_TEXT_ALIGN=$(validate_option "left right center justify" "$FLEX_TEXT_ALIGN" "center")
      fi

      break
      ;;
    "salir")
      exit 0
      ;;
    *)
      echo "Opción no válida. Por favor, elige 'defecto', 'personalizados', o 'salir'."
      ;;
  esac
done

# Solicitar el nombre del archivo HTML de salida
echo "Introduce el nombre del archivo HTML de salida (sin la extensión .html, por ejemplo, 'mi_archivo'):"
read -r OUTPUT_FILENAME

# Añadir la extensión .html al nombre del archivo
OUTPUT_FILENAME="$OUTPUT_FILENAME.html"

# Crear el archivo HTML
cat > "$OUTPUT_FILENAME" <<EOF
<!DOCTYPE html>
<html>
<head>
<style>
.$GRID_CONTAINER_CLASS {
  display: $GRID_DISPLAY;
  grid-template-columns: repeat($GRID_COLUMNS, minmax($GRID_MINMAX));
  grid-gap: $GRID_GAP;
  justify-items: $GRID_JUSTIFY_ITEMS;
  align-items: $GRID_ALIGN_ITEMS;
  text-align: $GRID_TEXT_ALIGN;  /* Añadido text-align para la sección de cuadrícula */
}

.$GRID_ITEM_INPUT_CLASS {
  background: $GRID_BACKGROUND_COLOR;
  color: $GRID_TEXT_COLOR;
  text-align: $GRID_TEXT_ALIGN;  /* Añadido text-align para los elementos de entrada de la sección de cuadrícula */
  border: $GRID_BORDER_COLOR $GRID_BORDER_WIDTH solid;
  width: $GRID_WIDTH;
  height: $GRID_HEIGHT;
}

.flex-container {
  display: $FLEX_DISPLAY;
  flex-direction: $FLEX_DIRECTION;
  flex-wrap: $FLEX_WRAP;
  justify-content: $FLEX_JUSTIFY_CONTENT;
  align-items: $FLEX_ALIGN_ITEMS;
  text-align: $FLEX_TEXT_ALIGN;  /* Añadido text-align para la sección de flexbox */
}

</style>
</head>
<body>
<div class="$GRID_CONTAINER_CLASS">
EOF

# Generar elementos de la cuadrícula
for ((i=1; i<="$GRID_ITEM_COUNT"; i++)); do
  echo "  <$GRID_ITEM_INPUT_TAG class=\"$GRID_ITEM_INPUT_CLASS\">$i</$GRID_ITEM_INPUT_TAG>" >> "$OUTPUT_FILENAME"
done

# Cerrar la cuadrícula principal y abrir la sección de flexbox
cat >> "$OUTPUT_FILENAME" <<EOF
</div> <!-- Cerrar la cuadrícula principal -->

<div class="$GRID_CONTAINER_CLASS flex-container"> <!-- Iniciar la sección de flexbox -->
EOF

# Generar elementos de la sección de flexbox
for ((i=1; i<="$GRID_ITEM_COUNT"; i++)); do
  echo "  <$GRID_ITEM_INPUT_TAG class=\"$GRID_ITEM_INPUT_CLASS\">$i</$GRID_ITEM_INPUT_TAG>" >> "$OUTPUT_FILENAME"
done

# Cerrar la sección de flexbox y el archivo HTML
cat >> "$OUTPUT_FILENAME" <<EOF
</div> <!-- Cerrar la sección de flexbox -->
</body>
</html>
EOF

echo "Archivo $OUTPUT_FILENAME creado con éxito."
