#!/bin/bash

# Función para generar archivo HTML
create_html_file() {
cat <<EOF >index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Selectores</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <section>
        <h2 class="titulo">Soy un h2</h2>
        <p>Soy p hermano adyacente</p>
        <h3>hola h3 dentro section</h3>
    </section>

    <section>
        <h2 class="titulo">Soy un h2</h2>
        <p>Soy p hermano adyacente</p>
    </section>

    <section>
        <h2 class="titulo">Soy un h2</h2>
        <p>Soy p hermano adyacente</p>
    </section>

    <p>Soy p fuera de section</p>
    <p>Soy p fuera de section</p>

    <ul>
        <li>Soy li #1</li>
        <li>Soy li #2</li>
        <li>Soy li #3</li>
        <li>Soy li #4</li>
    </ul>
</body>
</html>
EOF
echo "HTML file created: index.html"
}

# Función para generar archivo CSS
create_css_file() {
cat <<EOF >style.css
* {
    margin: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
}

section {
    text-align: center;
    margin-top: 40px;
}

h2 {
    font-size: 2rem;
    margin-bottom: 3rem;
}

.titulo + p {
    background-color: black;
    color: white;
    padding: 1rem;
}
EOF
echo "CSS file created: style.css"
}

# Función para mostrar menú y cambiar propiedades CSS
change_css_properties() {
    echo "Select a property to change:"
    echo "1. Background color"
    echo "2. Text color"
    echo "3. Padding"
    echo "4. Margin"
    echo "5. Font size"
    echo "6. Font family"
    echo "7. Border"
    echo "8. Exit"

    read -p "Enter your choice: " choice

    case $choice in
        1)
            read -p "Enter new background color: " bgColor
            sed -i "s/background-color: black;/background-color: $bgColor;/g" style.css
            echo "Background color updated to $bgColor"
            ;;
        2)
            read -p "Enter new text color: " textColor
            sed -i "s/color: white;/color: $textColor;/g" style.css
            echo "Text color updated to $textColor"
            ;;
        3)
            read -p "Enter new padding value: " paddingVal
            sed -i "s/padding: 1rem;/padding: $paddingVal;/g" style.css
            echo "Padding updated to $paddingVal"
            ;;
        4)
            read -p "Enter new margin value: " marginVal
            sed -i "s/margin: 0;/margin: $marginVal;/g" style.css
            echo "Margin updated to $marginVal"
            ;;
        5)
            read -p "Enter new font size: " fontSize
            sed -i "s/font-size: 2rem;/font-size: $fontSize;/g" style.css
            echo "Font size updated to $fontSize"
            ;;
        6)
            read -p "Enter new font family: " fontFamily
            sed -i "s/font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;/font-family: $fontFamily;/g" style.css
            echo "Font family updated to $fontFamily"
            ;;
        7)
            read -p "Enter new border value: " borderVal
            sed -i "s/border: none;/border: $borderVal;/g" style.css
            echo "Border updated to $borderVal"
            ;;
        8)
            echo "Exiting..."
            exit
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 8."
            ;;
    esac
}

# Menú principal
while true
do
    echo "Select an option:"
    echo "1. Create HTML file"
    echo "2. Create CSS file"
    echo "3. Change CSS properties"
    echo "4. Exit"

    read -p "Enter your choice: " option

    case $option in
        1)
            create_html_file
            ;;
        2)
            create_css_file
            ;;
        3)
            change_css_properties
            ;;
        4)
            echo "Exiting..."
            exit
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 4."
            ;;
    esac
done
