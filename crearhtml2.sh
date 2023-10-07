#!/bin/bash

# Valores por defecto
GRID_COLUMNS="auto-fit"
GRID_MINMAX="100px, 1fr"
GRID_GAP="5px"
GRID_WIDTH="100px"
GRID_HEIGHT="100px"
GRID_ITEM_COUNT=10

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
