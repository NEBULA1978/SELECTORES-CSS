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
    <link rel="stylesheet" href="style2.css">
</head>
<body>
    <section>
        <label for="check">Dame Click</label>
        <input type="checkbox" id="check">
        <div class="box"></div>
    </section>
</body>
</html>
EOF
echo "HTML file created: index.html"
}

# Función para generar archivo CSS
create_css_file() {
cat <<EOF >style2.css
* {
    margin: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
}

section {
    width: max-content;
    margin: 10px auto;
}

label {
    background-color: crimson;
    color: white;
    width: 200px;
    padding: 1rem;
    text-align: center;
    display: flex;
    justify-content: flex-start;
    margin-bottom: 30px;
    cursor: pointer;
    align-items: center;
}

.box {
    width: 200px;
    height: 200px;
    background-color: tomato;
    transition: .4s;
}

input[type="checkbox"] {
    margin: 0 auto;
    display: block;
}

input:checked+.box {
    transform: translateY(200px) rotate(80deg) scale(2);
}
EOF
echo "CSS file created: style2.css"
}

# Función para modificar contenido HTML
modify_html_content() {
    echo "Select an HTML element to modify content:"
    echo "1. Label"
    echo "2. Exit"

    read -p "Enter your choice: " choice

    case $choice in
        1)
            read -p "Enter new text for label: " newText
            sed -i "s/Dame Click/$newText/g" index.html
            echo "Label text updated to '$newText'"
            ;;
        2)
            echo "Exiting..."
            exit
            ;;
        *)
            echo "Invalid choice. Please enter 1 or 2."
            ;;
    esac
}

# Función para modificar valores CSS
modify_css_values() {
    echo "Select a CSS property to modify:"
    echo "1. Background color of label"
    echo "2. Color of label text"
    echo "3. Width of label"
    echo "4. Padding of label"
    echo "5. Background color of box"
    echo "6. Exit"

    read -p "Enter your choice: " choice

    case $choice in
        1)
            read -p "Enter new background color for label: " newColor
            sed -i "s/background-color: crimson;/background-color: $newColor;/g" style2.css
            echo "Background color of label updated to '$newColor'"
            ;;
        2)
            read -p "Enter new text color for label: " newColor
            sed -i "s/color: white;/color: $newColor;/g" style2.css
            echo "Color of label text updated to '$newColor'"
            ;;
        3)
            read -p "Enter new width for label: " newWidth
            sed -i "s/width: 200px;/width: $newWidth;/g" style2.css
            echo "Width of label updated to '$newWidth'"
            ;;
        4)
            read -p "Enter new padding for label: " newPadding
            sed -i "s/padding: 1rem;/padding: $newPadding;/g" style2.css
            echo "Padding of label updated to '$newPadding'"
            ;;
        5)
            read -p "Enter new background color for box: " newColor
            sed -i "s/background-color: tomato;/background-color: $newColor;/g" style2.css
            echo "Background color of box updated to '$newColor'"
            ;;
        6)
            echo "Exiting..."
            exit
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 6."
            ;;
    esac
}

# Función para mostrar menú principal
main_menu() {
    while true
    do
        echo "Select an option:"
        echo "1. Create HTML file"
        echo "2. Create CSS file"
        echo "3. Modify HTML content"
        echo "4. Modify CSS values"
        echo "5. Exit"

        read -p "Enter your choice: " option

        case $option in
            1)
                create_html_file
                ;;
            2)
                create_css_file
                ;;
            3)
                modify_html_content
                ;;
            4)
                modify_css_values
                ;;
            5)
                echo "Exiting..."
                exit
                ;;
            *)
                echo "Invalid choice. Please enter a number between 1 and 5."
                ;;
        esac
    done
}

# Llama al menú principal
main_menu
