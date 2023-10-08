#!/bin/bash

# Valores por defecto
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

# Opciones de CSS predefinidas
CSS_OPTIONS=("auto-fit auto-fill 2 3 4 1fr 2fr 3fr start end center stretch")
JUSTIFY_ITEMS_OPTIONS=("start end center stretch")
ALIGN_ITEMS_OPTIONS=("start end center stretch")

while true; do
  echo "¿Deseas utilizar valores por defecto o introducir valores personalizados? (defecto/personalizados/salir):"
  read choice

  case $choice in
    "defecto")
      # Usar valores por defecto
      break
      ;;
    "personalizados")
      # Solicitar valores personalizados
      echo "Introduce el número de columnas de la cuadrícula (opciones disponibles: ${CSS_OPTIONS[*]}):"
      read -r GRID_COLUMNS
      if [[ ! " ${CSS_OPTIONS[*]} " =~ " ${GRID_COLUMNS} " ]]; then
        echo "Opción no válida. Utilizando valor por defecto."
        GRID_COLUMNS="auto-fit"
      fi
      
      echo "Introduce la alineación horizontal de los elementos de la cuadrícula (opciones disponibles: ${JUSTIFY_ITEMS_OPTIONS[*]}):"
      read -r GRID_JUSTIFY_ITEMS
      if [[ ! " ${JUSTIFY_ITEMS_OPTIONS[*]} " =~ " ${GRID_JUSTIFY_ITEMS} " ]]; then
        echo "Opción no válida. Utilizando valor por defecto."
        GRID_JUSTIFY_ITEMS="center"
      fi
      
      echo "Introduce la alineación vertical de los elementos de la cuadrícula (opciones disponibles: ${ALIGN_ITEMS_OPTIONS[*]}):"
      read -r GRID_ALIGN_ITEMS
      if [[ ! " ${ALIGN_ITEMS_OPTIONS[*]} " =~ " ${GRID_ALIGN_ITEMS} " ]]; then
        echo "Opción no válida. Utilizando valor por defecto."
        GRID_ALIGN_ITEMS="center"
      fi
      
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
</style>
</head>
<body>
<div class="grid-container">
EOF

# Generar los elementos de la cuadrícula
for ((i=1; i<="$GRID_ITEM_COUNT"; i++)); do
  echo "  <div class=\"grid-item1\">$i</div>" >> index.html
done

# Cerrar el archivo HTML
cat >> index.html <<EOF
</div>
</body>
</html>
EOF

echo "Archivo index.html creado con éxito."
