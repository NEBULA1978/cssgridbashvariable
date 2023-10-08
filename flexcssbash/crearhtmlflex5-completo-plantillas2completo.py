def get_custom_values():
    GRID_DISPLAY = input("Introduce el tipo de display para div (por ejemplo, 'flex', 'block', etc.): ")
    FLEX_DIRECTION = input("Introduce la dirección de los elementos flexibles ('row', 'row-reverse', 'column', 'column-reverse'): ")
    FLEX_WRAP = input("Introduce la propiedad flex-wrap ('no-wrap', 'wrap', 'wrap-reverse'): ")
    JUSTIFY_CONTENT = input("Introduce la propiedad justify-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around'): ")
    ALIGN_ITEMS = input("Introduce la propiedad align-items ('flex-start', 'flex-end', 'center', 'stretch', 'baseline'): ")
    ALIGN_CONTENT = input("Introduce la propiedad align-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch'): ")
    
    return GRID_DISPLAY, FLEX_DIRECTION, FLEX_WRAP, JUSTIFY_CONTENT, ALIGN_ITEMS, ALIGN_CONTENT

def generate_html(GRID_DISPLAY, FLEX_DIRECTION, FLEX_WRAP, JUSTIFY_CONTENT, ALIGN_ITEMS, ALIGN_CONTENT):
    with open('flexbox_example.html', 'w') as f:
        f.write(f'''<!DOCTYPE html>
<html>
<head>
<style>
.flex-container {{
  display: {GRID_DISPLAY};
  flex-direction: {FLEX_DIRECTION};
  flex-wrap: {FLEX_WRAP};
  justify-content: {JUSTIFY_CONTENT};
  align-items: {ALIGN_ITEMS};
  align-content: {ALIGN_CONTENT};
  height: 300px; /* Ajusta la altura según sea necesario */
  border: 1px solid black; /* Agrega un borde para visualizar el contenedor */
}}

.flex-item {{
  width: 100px; /* Ancho de los elementos flexibles */
  height: 100px; /* Altura de los elementos flexibles */
  margin: 10px; /* Márgenes entre los elementos flexibles */
  background-color: lightgray; /* Color de fondo de los elementos */
}}
</style>
</head>
<body>
<div class="flex-container">
  <div class="flex-item">1</div>
  <div class="flex-item">2</div>
  <div class="flex-item">3</div>
</div>
</body>
</html>''')

while True:
    print("Menú de Ejemplos de Flexbox:")
    print("1. Ejemplo de Flexbox con dirección 'row'")
    print("   - Elementos colocados horizontalmente de izquierda a derecha.")
    print("2. Ejemplo de Flexbox con dirección 'row-reverse'")
    print("   - Elementos colocados horizontalmente de derecha a izquierda.")
    print("3. Ejemplo de Flexbox con dirección 'column'")
    print("   - Elementos colocados verticalmente de arriba abajo.")
    print("4. Ejemplo de Flexbox con dirección 'column-reverse'")
    print("   - Elementos colocados verticalmente de abajo arriba.")
    print("5. Ejemplo de Flexbox con personalización de valores")
    print("   - Puedes configurar los valores de Flexbox a tu elección.")
    print("6. Salir")

    OPTION = input("Selecciona una opción: ")

    if OPTION == '1':
        GRID_DISPLAY = 'flex'
        FLEX_DIRECTION = 'row'
        FLEX_WRAP = 'nowrap'
        JUSTIFY_CONTENT = 'flex-start'
        ALIGN_ITEMS = 'stretch'
        ALIGN_CONTENT = 'flex-start'
        generate_html(GRID_DISPLAY, FLEX_DIRECTION, FLEX_WRAP, JUSTIFY_CONTENT, ALIGN_ITEMS, ALIGN_CONTENT)
    elif OPTION == '2':
        GRID_DISPLAY = 'flex'
        FLEX_DIRECTION = 'row-reverse'
        FLEX_WRAP = 'nowrap'
        JUSTIFY_CONTENT = 'flex-start'
        ALIGN_ITEMS = 'stretch'
        ALIGN_CONTENT = 'flex-start'
        generate_html(GRID_DISPLAY, FLEX_DIRECTION, FLEX_WRAP, JUSTIFY_CONTENT, ALIGN_ITEMS, ALIGN_CONTENT)
    elif OPTION == '3':
        GRID_DISPLAY = 'flex'
        FLEX_DIRECTION = 'column'
        FLEX_WRAP = 'nowrap'
        JUSTIFY_CONTENT = 'flex-start'
        ALIGN_ITEMS = 'stretch'
        ALIGN_CONTENT = 'flex-start'
        generate_html(GRID_DISPLAY, FLEX_DIRECTION, FLEX_WRAP, JUSTIFY_CONTENT, ALIGN_ITEMS, ALIGN_CONTENT)
    elif OPTION == '4':
        GRID_DISPLAY = 'flex'
        FLEX_DIRECTION = 'column-reverse'
        FLEX_WRAP = 'nowrap'
        JUSTIFY_CONTENT = 'flex-start'
        ALIGN_ITEMS = 'stretch'
        ALIGN_CONTENT = 'flex-start'
        generate_html(GRID_DISPLAY, FLEX_DIRECTION, FLEX_WRAP, JUSTIFY_CONTENT, ALIGN_ITEMS, ALIGN_CONTENT)
    elif OPTION == '5':
        GRID_DISPLAY, FLEX_DIRECTION, FLEX_WRAP, JUSTIFY_CONTENT, ALIGN_ITEMS, ALIGN_CONTENT = get_custom_values()
        generate_html(GRID_DISPLAY, FLEX_DIRECTION, FLEX_WRAP, JUSTIFY_CONTENT, ALIGN_ITEMS, ALIGN_CONTENT)
    elif OPTION == '6':
        break
    else:
        print("Opción inválida. Introduce un número del 1 al 6.")
    
    print("Archivo HTML generado como 'flexbox_example.html'. Presiona Enter para continuar.")
    input()
