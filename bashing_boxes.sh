#!/bin/bash
#Author Of Script: Kunj
#Description: This is a simple bash program which manages an array of items.

#Makes our Array
box_items=("Tie" "Menu" "Umbrela" "Dish" "Flame" "Padlock" "Shampoo" "Egg" "Shield" "Nachos")
DATA_DIR="data"
mkdir -p "$DATA_DIR"

#These are our functions which play out each script/program.
print_list()
{
echo "${box_items[@]}"
}

print_item_at_position()
{
read -p "Enter the position of the item to print (1-${#box_items[@]}): " answer
if [[ "$answer" =~ ^[0-9]+$ ]] && (( answer >= 1 && answer <= ${#box_items[@]} )); then
	echo "Your item is: ${box_items[$((answer-1))]}"
else
	echo "Invalid position! Please enter a number between 1 and ${#box_items[@]}."
fi
}

add_item()
{
echo "What Do You Want To Call The Item?"
read ItemNew
box_items+=("$ItemNew")
echo "${box_items[@]}"
}

remove_last_item()
{
if [[ ${#box_items[@]} -gt 0 ]]; then
	unset 'box_items[-1]'
	box_items=("${box_items[@]}")
	echo "Last Item Removed."
	echo "${box_items[@]}"
else
	echo "The List Is Already Empty."
fi
}

remove_item_at_position()
{
read -p "Enter Position to Remove (1-${#box_items[@]}): " position_of_word
if [[ "$position_of_word" =~ ^[0-9]+$ ]] && (( position_of_word >= 1 && position_of_word <= ${#box_items[@]} )); then
	unset 'box_items[$((position_of_word-1))]'
	box_items=("${box_items[@]}")
	echo "Item at Position $position_of_word removed."
	echo "${box_items[@]}"
else
	echo "Invalid Position! Please Enter A Number Between 1 and ${#box_items[@]}."
fi
}

exit_program()
{
read -p "Would you like to save before exiting? (y/n): " choice
if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
	bashingbox7
fi
exit
}

save_box_to_file()
{
read -p "Enter a name for your save file: " filename
if [ -z "$filename" ]; then
	echo "Filename cannot be empty."
	return
fi
echo "${box_items[@]}" > "$DATA_DIR/$filename.txt"
echo "Box saved as $filename.txt"
}

load_box_from_file()
{
read -p "Enter the name of the file to load: " filename
if [ ! -f "$DATA_DIR/$filename.txt" ]; then
	echo "File not found!"
	return
fi
mapfile -t box_items < <(tr ' ' '\n' < "$DATA_DIR/$filename.txt")
echo "Box Loaded from $filename.txt"
echo "${box_items[@]}"
}

list_saved_boxes()
{
echo "Saved boxes:"
ls "$DATA_DIR"
}

delete_saved_box()
{
read -p "Enter the name of the save to delete: " filename
if [ -f "$DATA_DIR/$filename.txt" ]; then
	rm "$DATA_DIR/$filename.txt"
	echo "$filename.txt deleted."
else
	echo "No such file found."
fi
}











#Reads out options.
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

#Connects the input of the person to the function to do.
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
	

