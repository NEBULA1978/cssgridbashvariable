#!/bin/bash

# Valores por defecto
GRID_COLUMNS="auto-fit"
GRID_MINMAX="100px, 1fr"
GRID_GAP="5px"
GRID_WIDTH="100px"
GRID_HEIGHT="100px"
GRID_ITEM_COUNT=10

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
      echo "Introduce el número de columnas de la cuadrícula (por ejemplo, 'auto-fit', '3', '4fr', etc.):"
      read GRID_COLUMNS
      echo "Introduce el tamaño mínimo y máximo de las columnas de la cuadrícula (por ejemplo, '100px, 1fr', 'auto, 2fr', etc.):"
      read GRID_MINMAX
      echo "Introduce el espacio entre los elementos de la cuadrícula (por ejemplo, '5px', '10px', etc.):"
      read GRID_GAP
      echo "Introduce el ancho de los elementos de la cuadrícula (por ejemplo, '100px', '150px', etc.):"
      read GRID_WIDTH
      echo "Introduce el alto de los elementos de la cuadrícula (por ejemplo, '100px', '150px', etc.):"
      read GRID_HEIGHT
      echo "Introduce la cantidad de elementos en la cuadrícula (por ejemplo, '10', '20', etc.):"
      read GRID_ITEM_COUNT
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
  justify-items: center;
  align-items: center;
}

.grid-item1 {
  background: grey;
  text-align: center;
  border: black 5px solid;
  width: $GRID_WIDTH;
  height: $GRID_HEIGHT;
}
</style>
</head>
<body>
<div class="grid-container">
EOF

# Generar los elementos de la cuadrícula
for ((i=1; i<=$GRID_ITEM_COUNT; i++)); do
  echo "  <div class=\"grid-item1\">$i</div>" >> index.html
done

# Cerrar el archivo HTML
cat >> index.html <<EOF
</div>
</body>
</html>
EOF

echo "Archivo index.html creado con éxito."
