#!/bin/bash

# BASE64 VIEWER
# Author: AMAZ0NAS
# Description: A simple tool to encode and decode text using Base64.
# Usage: Run the script and follow the instructions to encode or decode a text.
# BASE64 Tool v1.0
# License: MIT
# Requires: base64 (GNU coreutils)
# Usage: ./base64tool.sh

show_menu() {
    clear
    echo "---------------------------------------"
    echo "            BASE64 VIEWER              "
    echo "---------------------------------------"
    echo "1 - Encode text to Base64"
    echo "2 - Decode Base64 to text"
    echo "0 - Exit"
    echo "---------------------------------------"
}

while true; do
    show_menu
    read -rp "Select an option: " option

    case "$option" in
        1)
            read -rp "Enter text to encode: " textencode
            encoded=$(echo -n "$textencode" | base64 -w 0)
            echo "Encoded result:"
            echo "$encoded"
            ;;
        2)
            read -rp "Enter text to decode: " textdecode
            if ! decoded=$(echo "$textdecode" | base64 -d 2>&1); then
                echo "Error: Invalid Base64 input"
            else
                echo "Decoded result:"
                echo "$decoded"
            fi
            ;;

        0)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option, please try again."
            ;;
    esac

    read -n 1 -s -r -p "Press any key to continue..."
done


