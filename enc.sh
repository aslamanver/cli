#!/bin/bash

# Interactive script to encrypt or decrypt files using OpenSSL with AES-256-CBC encryption

echo "File Encryption/Decryption Tool"
echo "==============================="
echo

# Ask user for operation
echo "What would you like to do?"
echo "1) Encrypt a file"
echo "2) Decrypt a file"
echo -n "Enter your choice (1 or 2): "
read choice

case $choice in
    1)
        echo -n "Enter the file name to encrypt: "
        read input_file
        
        if [ ! -f "$input_file" ]; then
            echo "Error: File '$input_file' not found!"
            exit 1
        fi
        
        output_file="${input_file}.enc"
        echo "Encrypting '$input_file' to '$output_file'..."
        openssl enc -aes-256-cbc -salt -pbkdf2 -iter 2000000 -in "$input_file" -out "$output_file"
        
        if [ $? -eq 0 ]; then
            echo "File encrypted successfully!"
        else
            echo "Encryption failed!"
            exit 1
        fi
        ;;
        
    2)
        echo -n "Enter the encrypted file name to decrypt: "
        read input_file
        
        if [ ! -f "$input_file" ]; then
            echo "Error: File '$input_file' not found!"
            exit 1
        fi
        
        # Remove .enc extension if present, otherwise add .dec
        if [[ "$input_file" == *.enc ]]; then
            output_file="${input_file%.enc}"
        else
            output_file="${input_file}.dec"
        fi
        
        echo "Decrypting '$input_file' to '$output_file'..."
        openssl enc -d -aes-256-cbc -salt -pbkdf2 -iter 2000000 -in "$input_file" -out "$output_file"
        
        if [ $? -eq 0 ]; then
            echo "File decrypted successfully!"
        else
            echo "Decryption failed!"
            exit 1
        fi
        ;;
        
    *)
        echo "Invalid choice. Please enter 1 or 2."
        exit 1
        ;;
esac