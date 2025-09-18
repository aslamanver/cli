#!/bin/bash

set -e

read -p "Encrypt (e) or Decrypt (d)? " choice
read -p "File name: " file

[ ! -f "$file" ] && { echo "File not found!"; exit 1; }

case $choice in
    e|E)
        openssl enc -aes-256-cbc -salt -pbkdf2 -iter 2000000 -in "$file" -out "${file}.enc"
        echo "Encrypted: ${file}.enc"
        ;;
    d|D)
        output="${file%.enc}"
        openssl enc -d -aes-256-cbc -salt -pbkdf2 -iter 2000000 -in "$file" -out "$output"
        echo "Decrypted: $output"
        if [[ "$output" == *.tar.gz ]]; then
            echo "Archive contents:"
            tar -tzf "$output"
        fi
        ;;
    *)
        echo "Invalid choice!"
        exit 1
        ;;
esac