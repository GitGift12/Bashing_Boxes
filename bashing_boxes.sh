#!/bin/bash
Frost=("Tie" "Menu" "Umbrela" "Dish" "Flame" "Padlock" "Shampoo" "Egg" "Shield" "Nachos")
echo "1. Print List"
echo "2. Print Item at Position"
echo "3. Add Item"
echo "4. Remove Last Item"
echo "5. Remove Item at Position"
echo "6. Exit"
read -p "Choose an option: " choice
case $choice in
	