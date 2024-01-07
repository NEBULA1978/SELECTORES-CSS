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

# Función para mostrar menú y modificar HTML/CSS
modify_files() {
    echo "Select an option:"
    echo "1. Modify HTML content"
    echo "2. Modify CSS properties"
    echo "3. Exit"

    read -p "Enter your choice: " choice

    case $choice in
        1)
            modify_html_content
            ;;
        2)
            change_css_properties
            ;;
        3)
            echo "Exiting..."
            exit
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 3."
            ;;
    esac
}

# Función para modificar contenido HTML
modify_html_content() {
    echo "Select an HTML element to modify content:"
    echo "1. h2"
    echo "2. p"
    echo "3. h3"
    echo "4. li"
    echo "5. Exit"

    read -p "Enter your choice: " choice

    case $choice in
        1)
            read -p "Enter new text for h2: " newText
            sed -i "s/Soy un h2/$newText/g" index.html
            echo "h2 text updated to '$newText'"
            ;;
        2)
            read -p "Enter new text for p: " newText
            sed -i "s/Soy p hermano adyacente/$newText/g" index.html
            echo "p text updated to '$newText'"
            ;;
        3)
            read -p "Enter new text for h3: " newText
            sed -i "s/hola h3 dentro section/$newText/g" index.html
            echo "h3 text updated to '$newText'"
            ;;
        4)
            read -p "Enter new text for li: " newText
            sed -i "s/Soy li #/$newText #/g" index.html
            echo "li text updated to '$newText'"
            ;;
        5)
            echo "Exiting..."
            exit
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 5."
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
        echo "3. Modify HTML/CSS"
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
                modify_files
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
}

# Llama al menú principal
main_menu
