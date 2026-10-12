#!/bin/bash

# ---------- FUNCIONES ----------

# Añade un usuario (simulado con un archivo de texto).
# Parámetro: $1 = nombre del usuario
anadir_usuario() {
    local nombre="$1"
    if [ -z "$nombre" ]; then
        read -p "Introduce el nombre: " nombre
    fi
    echo "$nombre" >> usuarios.txt
    echo "Usuario '$nombre' añadido."
}

# Lista los usuarios guardados.
# Sin parámetros.
listar_usuarios() {
    if [ -f usuarios.txt ]; then
        cat usuarios.txt
    else
        echo "No hay usuarios todavía."
    fi
}

# Muestra el espacio en disco.
# Sin parámetros.
espacio_disco() {
    local fecha
    fecha=$(date)
    echo "Espacio en disco a fecha $fecha:"
    df -h
}

# Muestra información del sistema.
# Sin parámetros.
info_sistema() {
    local host
    host=$(hostname)
    echo "Equipo: $host"
    echo "Kernel: $(uname -r)"
    echo "Usuario actual: $(whoami)"
}

# Muestra el menú en pantalla.
mostrar_menu() {
    echo "=============================="
    echo "   MENÚ DE GESTIÓN DE SISTEMA"
    echo "=============================="
    echo "1) Añadir usuario"
    echo "2) Listar usuarios"
    echo "3) Espacio en disco"
    echo "4) Información del sistema"
    echo "5) Salir"
}

# ---------- LÓGICA PRINCIPAL ----------

# Si hay parámetros, ejecuta la opción directamente y termina
if [ $# -gt 0 ]; then
    case "$1" in
        1|-a|--add)    anadir_usuario "$2" ;;
        2|-l|--list)   listar_usuarios ;;
        3|-d|--disk)   espacio_disco ;;
        4|-i|--info)   info_sistema ;;
        *) echo "Opción no válida: $1"; exit 1 ;;
    esac
    exit 0
fi

# Si no hay parámetros, menú interactivo en bucle
opcion=0
while [ "$opcion" != "5" ]; do
    mostrar_menu
    read -p "Elige una opción: " opcion
    case "$opcion" in
        1) anadir_usuario ;;
        2) listar_usuarios ;;
        3) espacio_disco ;;
        4) info_sistema ;;
        5) echo "Saliendo..." ;;
        *) echo "Opción no válida." ;;
    esac
    echo
done
