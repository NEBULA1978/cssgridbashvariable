#!/bin/bash

# Función para solicitar valores personalizados
get_custom_values() {
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

  echo "Introduce la dirección flexible (por ejemplo, 'row', 'row-reverse', 'column', etc.):"
  read -r FLEX_DIRECTION

  echo "Introduce el ajuste de línea flexible (por ejemplo, 'no-wrap', 'wrap', 'wrap-reverse', etc.):"
  read -r FLEX_WRAP

  echo "Introduce el valor de flex-flow (por ejemplo, 'row-reverse wrap', 'column nowrap', etc.):"
  read -r FLEX_FLOW

  echo "Introduce el valor de order (entero positivo o negativo):"
  read -r ORDER

  echo "Introduce el valor de flex-basis (por ejemplo, 'content', 'auto', '120px', '20%', etc.):"
  read -r FLEX_BASIS

  echo "Introduce el valor de flex-grow (entero positivo):"
  read -r FLEX_GROW

  echo "Introduce el valor de flex-shrink (entero positivo):"
  read -r FLEX_SHRINK

  echo "Introduce el valor de justify-content (por ejemplo, 'flex-start', 'flex-end', 'center', 'space-between', 'space-around', etc.):"
  read -r JUSTIFY_CONTENT

  echo "Introduce el valor de align-items (por ejemplo, 'flex-start', 'flex-end', 'center', 'stretch', 'baseline', etc.):"
  read -r ALIGN_ITEMS

  echo "Introduce el valor de align-content (por ejemplo, 'flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch', etc.):"
  read -r ALIGN_CONTENT

  echo "Introduce el valor de align-self (por ejemplo, 'flex-start', 'flex-end', 'center', 'stretch', 'baseline', etc.):"
  read -r ALIGN_SELF
}

# Valores por defecto
DEFAULT_GRID_DISPLAY="flex"
DEFAULT_GRID_MARGIN_BOTTOM="5px"
DEFAULT_GRID_BACKGROUND_COLOR="#eee"
DEFAULT_P_WIDTH="100px"
DEFAULT_P_BORDER="black 1px solid"
DEFAULT_P_MARGIN="2px"
DEFAULT_FLEX_DIRECTION="row"
DEFAULT_FLEX_WRAP="no-wrap"
DEFAULT_FLEX_FLOW="row-reverse wrap"
DEFAULT_ORDER="-1"
DEFAULT_FLEX_BASIS="auto"
DEFAULT_FLEX_GROW="1"
DEFAULT_FLEX_SHRINK="1"
DEFAULT_FLEX="initial"
DEFAULT_MARGIN_AUTO=""
DEFAULT_JUSTIFY_CONTENT="flex-start"
DEFAULT_ALIGN_ITEMS="stretch"       # Nuevo valor por defecto para align-items
DEFAULT_ALIGN_CONTENT="flex-start" # Nuevo valor por defecto para align-content
DEFAULT_ALIGN_SELF="auto"          # Nuevo valor por defecto para align-self

# Solicitar al usuario si desea utilizar valores por defecto o introducir valores personalizados
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
  ALIGN_ITEMS="$DEFAULT_ALIGN_ITEMS"       # Nuevo valor por defecto para align-items
  ALIGN_CONTENT="$DEFAULT_ALIGN_CONTENT" # Nuevo valor por defecto para align-content
  ALIGN_SELF="$DEFAULT_ALIGN_SELF"       # Nuevo valor por defecto para align-self
else
  # Solicitar valores personalizados
  get_custom_values
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
  display: $GRID_DISPLAY;
  flex-direction: $FLEX_DIRECTION;
  flex-wrap: $FLEX_WRAP;
  flex-flow: $FLEX_FLOW;
  order: $ORDER;
  flex-basis: $FLEX_BASIS;
  flex-grow: $FLEX_GROW;
  flex-shrink: $FLEX_SHRINK;
  justify-content: $JUSTIFY_CONTENT;
  align-items: $ALIGN_ITEMS;       # Nueva propiedad align-items
  align-content: $ALIGN_CONTENT; # Nueva propiedad align-content
  margin-bottom: $GRID_MARGIN_BOTTOM;
  background-color: $GRID_BACKGROUND_COLOR;
}

p {
  width: $P_WIDTH;
  border: $P_BORDER;
  margin: $P_MARGIN;
  $MARGIN_AUTO
  align-self: $ALIGN_SELF; # Nueva propiedad align-self
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


#     display: flex;: Esta propiedad CSS se aplica a un contenedor (por ejemplo, un elemento <div>) y establece que sus elementos secundarios (hijos) deben usar el modelo de diseño flexbox. Esto permite crear diseños flexibles y responsivos.

#     flex-direction: Esta propiedad controla la dirección en la que los elementos secundarios se distribuyen dentro del contenedor flex. Puedes establecer valores como row (por defecto), row-reverse, column, o column-reverse.

#     flex-wrap: Esta propiedad controla si los elementos secundarios deben envolverse en múltiples líneas cuando el espacio es insuficiente en la dirección principal. Puedes usar valores como nowrap (por defecto), wrap, o wrap-reverse.

#     flex-flow: Esta propiedad es una abreviatura que combina flex-direction y flex-wrap en una sola declaración. Por ejemplo, puedes usar "row wrap" para establecer la dirección a "fila" y el ajuste a "envolver".

#     order: Esta propiedad controla el orden en el que se muestran los elementos secundarios dentro del contenedor flex. Puedes asignar valores numéricos positivos o negativos para cambiar el orden.

#     flex-basis: Esta propiedad establece el tamaño inicial de un elemento secundario antes de que comience a crecer o encogerse. Puedes usar valores como auto, content, un porcentaje, o un valor en píxeles.

#     flex-grow: Esta propiedad controla cuánto espacio adicional pueden ocupar los elementos secundarios cuando hay espacio disponible. Un valor mayor significa que crecerán más.

#     flex-shrink: Esta propiedad controla cuánto espacio pueden encogerse los elementos secundarios cuando el espacio es limitado. Un valor mayor significa que encogerán más.

#     justify-content: Esta propiedad controla cómo se distribuyen los elementos secundarios a lo largo del eje principal del contenedor flex. Puedes usar valores como flex-start, flex-end, center, space-between, y space-around.

#     align-items: Esta propiedad controla cómo se alinean los elementos secundarios en el eje secundario (perpendicular) del contenedor flex. Puedes usar valores como flex-start, flex-end, center, stretch, y baseline.

#     align-self: Esta propiedad se aplica a un elemento secundario individual y controla su alineación en el eje secundario. Los valores son similares a los de align-items.

#     align-content: Esta propiedad controla cómo se distribuye el espacio adicional en el eje secundario cuando hay múltiples líneas de elementos secundarios. Los valores son similares a los de justify-content.

# Estas propiedades son esenciales para crear diseños flexibles y responsivos utilizando flexbox en CSS. Puedes ajustar sus valores según tus necesidades para lograr diseños específicos.