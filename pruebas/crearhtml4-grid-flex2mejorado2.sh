#!/bin/bash

# Función para establecer valores predefinidos
set_predefined_values() {
  local preset_name="$1"

  case $preset_name in
  "default")
    # Valores por defecto
    GRID_COLUMNS="auto-fit"
    GRID_MINMAX="100px 1fr"
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
    FLEX_DISPLAY="flex"
    FLEX_DIRECTION="row"
    FLEX_WRAP="wrap"
    FLEX_JUSTIFY_CONTENT="center"
    FLEX_ALIGN_ITEMS="center"
    ;;

  "custom1")
    # Valores personalizados 1
    GRID_COLUMNS="3"
    GRID_MINMAX="150px 2fr"
    GRID_GAP="10px"
    GRID_WIDTH="150px"
    GRID_HEIGHT="150px"
    GRID_ITEM_COUNT=12
    GRID_BACKGROUND_COLOR="lightblue"
    GRID_TEXT_COLOR="white"
    GRID_BORDER_COLOR="blue"
    GRID_BORDER_WIDTH="3px"
    GRID_JUSTIFY_ITEMS="start"
    GRID_ALIGN_ITEMS="end"
    GRID_TEXT_ALIGN="left"
    GRID_ITEM_INPUT_TAG="span"
    GRID_ITEM_INPUT_CLASS="grid-item-custom1"
    GRID_CONTAINER_CLASS="grid-container-custom1"
    FLEX_DISPLAY="flex"
    FLEX_DIRECTION="column"
    FLEX_WRAP="nowrap"
    FLEX_JUSTIFY_CONTENT="flex-start"
    FLEX_ALIGN_ITEMS="flex-end"
    ;;

  "custom2")
    # Valores personalizados 2
    GRID_COLUMNS="4"
    GRID_MINMAX="120px 1fr"
    GRID_GAP="8px"
    GRID_WIDTH="120px"
    GRID_HEIGHT="120px"
    GRID_ITEM_COUNT=8
    GRID_BACKGROUND_COLOR="lightgreen"
    GRID_TEXT_COLOR="black"
    GRID_BORDER_COLOR="green"
    GRID_BORDER_WIDTH="2px"
    GRID_JUSTIFY_ITEMS="end"
    GRID_ALIGN_ITEMS="start"
    GRID_TEXT_ALIGN="right"
    GRID_ITEM_INPUT_TAG="p"
    GRID_ITEM_INPUT_CLASS="grid-item-custom2"
    GRID_CONTAINER_CLASS="grid-container-custom2"
    FLEX_DISPLAY="inline-flex"
    FLEX_DIRECTION="row-reverse"
    FLEX_WRAP="wrap-reverse"
    FLEX_JUSTIFY_CONTENT="flex-end"
    FLEX_ALIGN_ITEMS="flex-start"
    ;;

  *)
    echo "Conjunto predefinido no válido. Utilizando valores por defecto."
    set_predefined_values "default"
    ;;
  esac
}

# Llama a la función para configurar los valores por defecto
set_predefined_values "default"

# Solicitar al usuario que elija un conjunto predefinido
echo "Elige un conjunto predefinido (default/custom1/custom2):"
read -r user_preset

# Configurar valores en función de la elección del usuario
set_predefined_values "$user_preset"

# Crear el archivo HTML con los valores configurados
cat >"index.html" <<EOF
<!DOCTYPE html>
<html>
<head>
<style>
.$GRID_CONTAINER_CLASS {
  display: $FLEX_DISPLAY;
  grid-template-columns: $GRID_COLUMNS;
  grid-gap: $GRID_GAP;
  justify-items: $GRID_JUSTIFY_ITEMS;
  align-items: $GRID_ALIGN_ITEMS;
}

.$GRID_ITEM_INPUT_CLASS {
  background: $GRID_BACKGROUND_COLOR;
  color: $GRID_TEXT_COLOR;
  text-align: $GRID_TEXT_ALIGN;
  border: $GRID_BORDER_COLOR $GRID_BORDER_WIDTH solid;
  width: $GRID_WIDTH;
  height: $GRID_HEIGHT;
}

.$FLEX_CONTAINER_CLASS {
  display: $FLEX_DISPLAY;
  flex-direction: $FLEX_DIRECTION;
  flex-wrap: $FLEX_WRAP;
  justify-content: $FLEX_JUSTIFY_CONTENT;
  align-items: $FLEX_ALIGN_ITEMS;
}

</style>
</head>
<body>
<div class="$GRID_CONTAINER_CLASS">
EOF

# Generar elementos de la cuadrícula
for ((i = 1; i <= $GRID_ITEM_COUNT; i++)); do
  echo "  <$GRID_ITEM_INPUT_TAG class=\"$GRID_ITEM_INPUT_CLASS\">Item $i</$GRID_ITEM_INPUT_TAG>"
done

# Cerrar el archivo HTML
echo "</div></body></html>" >>"index.html"

echo "Archivo HTML generado con éxito."
