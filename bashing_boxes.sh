#!/bin/bash
#Author Of Script: Kunj
#Description: This is a simple bash program which manages an array of items.


Frost=("Tie" "Menu" "Umbrela" "Dish" "Flame" "Padlock" "Shampoo" "Egg" "Shield" "Nachos")
DATA_DIR="data"
mkdir -p "$DATA_DIR"

bashingbox()
{
echo "${Frost[@]}"
}

bashingbox2()
{
read -p "Enter the position of the item to print (1-${#Frost[@]}): " answer
if [[ "$answer" =~ ^[0-9]+$ ]] && (( answer >= 1 && answer <= ${#Frost[@]} )); then
	echo "Your item is: ${Frost[$((answer-1))]}"
else
	echo "Invalid position! Please enter a number between 1 and ${#Frost[@]}."
fi
}

bashingbox3()
{
echo "What Do You Want To Call The Item?"
read ItemNew
Frost+=("$ItemNew")
echo "${Frost[@]}"
}

bashingbox4()
{
if [[ ${#Frost[@]} -gt 0 ]]; then
	unset 'Frost[-1]'
	Frost=("${Frost[@]}")
	echo "Last Item Removed."
	echo "${Frost[@]}"
else
	echo "The List Is Already Empty."
fi
}

bashingbox5()
{
read -p "Enter Position to Remove (1-${#Frost[@]}): " position_of_word
if [[ "$position_of_word" =~ ^[0-9]+$ ]] && (( position_of_word >= 1 && position_of_word <= ${#Frost[@]} )); then
	unset 'Frost[$((position_of_word-1))]'
	Frost=("${Frost[@]}")
	echo "Item at Position $position_of_word removed."
	echo "${Frost[@]}"
else
	echo "Invalid Position! Please Enter A Number Between 1 and ${#Frost[@]}."
fi
}

bashingbox7()
{
read -p "Enter a name for your save file: " filename
if [ -z "$filename" ]; then
	echo "Filename cannot be empty."
	return
fi
echo "${Frost[@]}" > "$DATA_DIR/$filename.txt"
echo "Box saved as $filename.txt"
}

bashingbox8()
{
read -p "Enter the name of the file to load: " filename
if [ ! -f "$DATA_DIR/$filename.txt" ]; then
	echo "File not found!"
	return
fi
mapfile -t Frost < <(tr ' ' '\n' < "$DATA_DIR/$filename.txt")
echo "Box Loaded from $filename.txt"
echo "${Frost[@]}"
}

bashingbox9()
{
echo "Saved boxes:"
ls "$DATA_DIR"
}

bashingbox0()
{
read -p "Enter the name of the save to delete: " filename
if [ -f "$DATA_DIR/$filename.txt" ]; then
	rm "$DATA_DIR/$filename.txt"
	echo "$filename.txt deleted."
else
	echo "No such file found."
fi
}

bashingbox6()
{
read -p "Would you like to save before exiting? (y/n): " choice
if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
	bashingbox7
fi
exit
}











echo "1. Print List"
echo "2. Print Item at Position"
echo "3. Add Item"
echo "4. Remove Last Item"
echo "5. Remove Item at Position"
echo "6. Exit"
echo "7. Save Box"
echo "8. Load Box"
echo "9. List Saved Boxes"
echo "0. Delete Saved Box"
read -p "Choose an option: " choice

case $choice in 
	1) print_list ;;
	2) print_item_at_position ;;
	3) add_item ;;
	4) remove_last_item ;;
	5) remove_item_at_position ;;
	6) exit_program ;;
	7) save_box_to_file ;;
	8) load_box_from_file ;;
	9) list_saved_boxes ;;
	0) delete_saved_box ;;
	*) echo "Invalid Option! Please choose a valid number." ;;
esac
	

