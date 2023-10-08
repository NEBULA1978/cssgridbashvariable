#!/bin/bash

# Valores por defecto para la sección de cuadrícula
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

# Valores por defecto para la sección de flexbox
FLEX_DIRECTION="row"
FLEX_WRAP="wrap"
FLEX_JUSTIFY_CONTENT="center"
FLEX_ALIGN_ITEMS="center"

while true; do
  echo "¿Deseas utilizar valores por defecto o introducir valores personalizados? (defecto/personalizados/salir):"
  read choice

  case $choice in
    "defecto")
      # Usar valores por defecto
      break
      ;;
    "personalizados")
      # Solicitar valores personalizados para la sección de cuadrícula
      echo "Introduce el número de columnas de la cuadrícula (por ejemplo, 'auto-fit', '3', '4fr', etc.):"
      read -r GRID_COLUMNS
      echo "Introduce el tamaño mínimo y máximo de las columnas de la cuadrícula (por ejemplo, '100px, 1fr', 'auto, 2fr', etc.):"
      read -r GRID_MINMAX
      echo "Introduce el espacio entre los elementos de la cuadrícula (por ejemplo, '5px', '10px', etc.):"
      read -r GRID_GAP
      echo "Introduce el ancho de los elementos de la cuadrícula (por ejemplo, '100px', '150px', etc.):"
      read -r GRID_WIDTH
      echo "Introduce el alto de los elementos de la cuadrícula (por ejemplo, '100px', '150px', etc.):"
      read -r GRID_HEIGHT
      echo "Introduce la cantidad de elementos en la cuadrícula (por ejemplo, '10', '20', etc.):"
      read -r GRID_ITEM_COUNT
      echo "Introduce el color de fondo de los elementos de la cuadrícula (por ejemplo, 'red', '#00ff00', etc.):"
      read -r GRID_BACKGROUND_COLOR
      echo "Introduce el color de texto de los elementos de la cuadrícula (por ejemplo, 'black', '#ffffff', etc.):"
      read -r GRID_TEXT_COLOR
      echo "Introduce el color del borde de los elementos de la cuadrícula (por ejemplo, 'black', '#ff0000', etc.):"
      read -r GRID_BORDER_COLOR
      echo "Introduce el ancho del borde de los elementos de la cuadrícula (por ejemplo, '5px', '2px', etc.):"
      read -r GRID_BORDER_WIDTH
      echo "Introduce la alineación horizontal de los elementos de la cuadrícula (por ejemplo, 'start', 'center', 'end', etc.):"
      read -r GRID_JUSTIFY_ITEMS
      echo "Introduce la alineación vertical de los elementos de la cuadrícula (por ejemplo, 'start', 'center', 'end', etc.):"
      read -r GRID_ALIGN_ITEMS
      
      # Solicitar valores personalizados para la sección de flexbox
      echo "¿Deseas utilizar flexbox en lugar de grid para la sección de Flexbox? (si/no):"
      read use_flexbox
      
      if [[ $use_flexbox == "si" ]]; then
        echo "Introduce la dirección de flex (opciones disponibles: row, row-reverse, column, column-reverse):"
        read -r FLEX_DIRECTION
        echo "Introduce el wrap de flex (opciones disponibles: wrap, nowrap, wrap-reverse):"
        read -r FLEX_WRAP
        echo "Introduce la alineación horizontal de flex (opciones disponibles: flex-start, flex-end, center, space-between, space-around, space-evenly):"
        read -r FLEX_JUSTIFY_CONTENT
        echo "Introduce la alineación vertical de flex (opciones disponibles: flex-start, flex-end, center, baseline, stretch):"
        read -r FLEX_ALIGN_ITEMS
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

# Crear el archivo index.html
cat > index.html <<EOF
<!DOCTYPE html>
<html>
<head>
<style>
/* Estilos para la sección de cuadrícula */
.grid-container {
  display: grid;
  grid-template-columns: repeat($GRID_COLUMNS, minmax($GRID_MINMAX));
  grid-gap: $GRID_GAP;
  justify-items: $GRID_JUSTIFY_ITEMS;
  align-items: $GRID_ALIGN_ITEMS;
}

.grid-item1 {
  background: $GRID_BACKGROUND_COLOR;
  color: $GRID_TEXT_COLOR;
  text-align: center;
  border: $GRID_BORDER_COLOR $GRID_BORDER_WIDTH solid;
  width: $GRID_WIDTH;
  height: $GRID_HEIGHT;
}

/* Estilos para la sección de flexbox (si se elige utilizar flexbox) */
.flex-container {
  display: flex;
  flex-direction: $FLEX_DIRECTION;
  flex-wrap: $FLEX_WRAP;
  justify-content: $FLEX_JUSTIFY_CONTENT;
  align-items: $FLEX_ALIGN_ITEMS;
}

.flex-item {
  background: $GRID_BACKGROUND_COLOR;
  color: $GRID_TEXT_COLOR;
  text-align: center;
  border: $GRID_BORDER_COLOR $GRID_BORDER_WIDTH solid;
  width: $GRID_WIDTH;
  height: $GRID_HEIGHT;
}
</style>
</head>
<body>
<div class="grid-container">
EOF

# Generar los elementos de la sección de cuadrícula
for ((i=1; i<="$GRID_ITEM_COUNT"; i++)); do
  echo "  <div class=\"grid-item1\">$i</div>" >> index.html
done

# Si se elige utilizar flexbox, agregar la sección de flexbox
if [[ $use_flexbox == "si" ]]; then
  cat >> index.html <<EOF
</div> <!-- Cerrar la sección de cuadrícula -->

<div class="flex-container"> <!-- Iniciar la sección de flexbox -->
EOF

  # Generar elementos de la sección de flexbox
  for ((i=1; i<="$GRID_ITEM_COUNT"; i++)); do
    echo "  <div class=\"flex-item\">$i</div>" >> index.html
  done
fi

# Cerrar el archivo HTML
cat >> index.html <<EOF
</div> <!-- Cerrar la sección de flexbox (si se eligió utilizar flexbox) -->
</body>
</html>
EOF

echo "Archivo index.html creado con éxito."
