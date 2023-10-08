#!/bin/bash

# Valores por defecto
DEFAULT_GRID_DISPLAY="flex"
DEFAULT_GRID_MARGIN_BOTTOM="5px"
DEFAULT_GRID_BACKGROUND_COLOR="#eee"
DEFAULT_P_WIDTH="100px"
DEFAULT_P_BORDER="black 1px solid"
DEFAULT_P_MARGIN="2px"

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
  margin-bottom: $GRID_MARGIN_BOTTOM;
  background-color: $GRID_BACKGROUND_COLOR;
}

p {
  width: $P_WIDTH;
  border: $P_BORDER;
  margin: $P_MARGIN;
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
