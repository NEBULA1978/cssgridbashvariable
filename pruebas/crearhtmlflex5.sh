#!/bin/bash

# Valores por defecto
DEFAULT_GRID_DISPLAY="flex"
DEFAULT_GRID_MARGIN_BOTTOM="5px"
DEFAULT_GRID_BACKGROUND_COLOR="#eee"
DEFAULT_P_WIDTH="100px"
DEFAULT_P_BORDER="black 1px solid"
DEFAULT_P_MARGIN="2px"
DEFAULT_FLEX_DIRECTION="row" # Valor por defecto para flex-direction
DEFAULT_FLEX_WRAP="no-wrap" # Valor por defecto para flex-wrap
DEFAULT_FLEX_FLOW="row-reverse wrap" # Valor por defecto para flex-flow
DEFAULT_ORDER="-1" # Valor por defecto para order
DEFAULT_FLEX_BASIS="auto" # Valor por defecto para flex-basis
DEFAULT_FLEX_GROW="1" # Valor por defecto para flex-grow
DEFAULT_FLEX_SHRINK="1" # Valor por defecto para flex-shrink
DEFAULT_FLEX="initial" # Valor por defecto para flex (propiedad compuesta)
DEFAULT_MARGIN_AUTO="" # Valor por defecto para margin: auto
DEFAULT_JUSTIFY_CONTENT="flex-start" # Valor por defecto para justify-content

# Solicitar al usuario si desea utilizar valores por defecto o personalizados
echo "¿Deseas utilizar valores por defecto (defecto) o introducir valores personalizados (personalizados)?"
read -r choice

# Utilizar valores por defecto o personalizados según la elección del usuario
if [ "$choice" == "defecto" ]; then
  GRID_DISPLAY="$DEFAULT_GRID_DISPLAY"
  GRID_MARGIN_BOTTOM="$DEFAULT_GRID_MARGIN_BOTTOM"
  GRID_BACKGROUND_COLOR="$DEFAULT_GRID_BACKGROUND_COLOR"
  P_WIDTH="$DEFAULT_P_WIDTH"
  P_BORDER="$DEFAULT_P_BORDER"
  P_MARGIN="$DEFAULT_P_MARGIN"
  FLEX_DIRECTION="$DEFAULT_FLEX_DIRECTION"
  FLEX_WRAP="$DEFAULT_FLEX_WRAP"
  FLEX_FLOW="$DEFAULT_FLEX_FLOW"
  ORDER="$DEFAULT_ORDER"
  FLEX_BASIS="$DEFAULT_FLEX_BASIS"
  FLEX_GROW="$DEFAULT_FLEX_GROW"
  FLEX_SHRINK="$DEFAULT_FLEX_SHRINK"
  MARGIN_AUTO="$DEFAULT_MARGIN_AUTO"
  JUSTIFY_CONTENT="$DEFAULT_JUSTIFY_CONTENT"
else
  # Solicitar valores personalizados
  echo "Introduce el tipo de display para div (por ejemplo, 'flex', 'block', etc.):"
  read -r GRID_DISPLAY

  echo "Introduce el margen inferior para div (por ejemplo, '5px', '10px', etc.):"
  read -r GRID_MARGIN_BOTTOM

  echo "Introduce el color de fondo para div (por ejemplo, '#eee', '#ffffff', etc.):"
  read -r GRID_BACKGROUND_COLOR

  echo "Introduce el ancho de los párrafos (por ejemplo, '100px', '200px', etc.):"
  read -r P_WIDTH

  echo "Introduce el borde de los párrafos (por ejemplo, 'black 1px solid', 'red 2px dashed', etc.):"
  read -r P_BORDER

  echo "Introduce el margen de los párrafos (por ejemplo, '2px', '5px', etc.):"
  read -r P_MARGIN
  
  # Solicitar la dirección flexible personalizada
  echo "Introduce la dirección flexible (por ejemplo, 'row', 'row-reverse', 'column', etc.):"
  read -r FLEX_DIRECTION
  
  # Solicitar el ajuste de línea flexible personalizado
  echo "Introduce el ajuste de línea flexible (por ejemplo, 'no-wrap', 'wrap', 'wrap-reverse', etc.):"
  read -r FLEX_WRAP
  
  # Solicitar el valor de flex-flow personalizado
  echo "Introduce el valor de flex-flow (por ejemplo, 'row-reverse wrap', 'column nowrap', etc.):"
  read -r FLEX_FLOW
  
  # Solicitar el valor de order personalizado
  echo "Introduce el valor de order (entero positivo o negativo):"
  read -r ORDER
  
  # Solicitar el valor de flex-basis personalizado
  echo "Introduce el valor de flex-basis (por ejemplo, 'content', 'auto', '120px', '20%', etc.):"
  read -r FLEX_BASIS
  
  # Solicitar el valor de flex-grow personalizado
  echo "Introduce el valor de flex-grow (entero positivo):"
  read -r FLEX_GROW
  
  # Solicitar el valor de flex-shrink personalizado
  echo "Introduce el valor de flex-shrink (entero positivo):"
  read -r FLEX_SHRINK
  

  # Solicitar el valor de justify-content personalizado
  echo "Introduce el valor de justify-content (por ejemplo, 'flex-start', 'flex-end', 'center', 'space-between', 'space-around', etc.):"
  read -r JUSTIFY_CONTENT
fi

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
div {
  /* El contenedor se comporta como un bloque, es decir, ocupa todo el espacio horizontal disponible */
  display: $GRID_DISPLAY;
  flex-direction: $FLEX_DIRECTION;
  flex-wrap: $FLEX_WRAP;
  flex-flow: $FLEX_FLOW;
  order: $ORDER;
  flex-basis: $FLEX_BASIS;
  flex-grow: $FLEX_GROW;
  flex-shrink: $FLEX_SHRINK;
  justify-content: $JUSTIFY_CONTENT;
  margin-bottom: $GRID_MARGIN_BOTTOM;
  background-color: $GRID_BACKGROUND_COLOR;
}

p {
  width: $P_WIDTH;
  border: $P_BORDER;
  margin: $P_MARGIN;
  $MARGIN_AUTO
}
</style>
</head>
<body>
<div>
  <p>Elemento 1</p>
  <p>Elemento 2</p>
  <p>Elemento 3</p>
  <p>Elemento 4</p>
  <p>Elemento 5</p>
  <p>Elemento 6</p>
  <p>Elemento 7</p>
  <p>Elemento 8</p>
</div>
</body>
</html>
EOF

echo "Archivo $OUTPUT_FILENAME creado con éxito."
