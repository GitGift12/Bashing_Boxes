#!/bin/bash
#Author Of Script: Kunj
#Description: This is a simple bash program which manages an array of items.

#Makes our Array
box_items=("Tie" "Menu" "Umbrella" "Dish" "Flame" "Padlock" "Shampoo" "Egg" "Shield" "Nachos")
DATA_DIR="data"
mkdir -p "$DATA_DIR"

# Define color codes
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
CYAN="\e[36m"
RESET="\e[0m"
echo -e "${CYAN}Welcome to Bashing Boxes!${RESET}"
sleep 1



#These are our functions which play out each script/program.
#Reads out options.
user_input(){


echo -e "${BLUE}1. Print List${RESET}\n2. Print Item at Position\n3. Add Item\n4. Remove Last Item\n5. Remove Item at Position\n6. Exit\n7. Save Box\n8. Load Box\n9. List Saved Boxes\n0. Delete Saved Box"
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
}

	

print_list()
{
echo "${box_items[@]}"
user_input
}

print_item_at_position()
{
read -p "Enter item position: " user_input
    echo "Your item is: ${box_items[$((user_input-1))]}"
    user_input
}

add_item()
{
echo "What Do You Want To Call The Item?"
read ItemNew
box_items+=("$ItemNew")
echo "${box_items[@]}"
user_input
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
user_input
}

remove_item_at_position()
{
read -p "Enter position to remove: " user_input
    if [[ "$user_input" =~ ^[0-9]+$ ]] && (( user_input >= 1 && user_input <= ${#box_items[@]} )); then
        unset "box_items[$((user_input-1))]"
        echo -e "Item at position $user_input removed.\n${box_items[@]}"
    else
        echo -e "Invalid position! Enter a number between 1 and ${#box_items[@]}."
    fi
user_input
}

exit_program()
{
read -p "Would you like to save before exiting? (y/n): " choice
if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
	save_box_to_file
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
user_input
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
user_input
}

list_saved_boxes()
{
echo "Saved boxes:"
ls "$DATA_DIR"
user_input
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
user_input
}

generate_random_box()
{
	local file="warehouse_of_objects.txt"

	#Checks file prescence and validity
	 if [[ ! -s "$file" ]]; then
        echo -e "${RED}Error: File missing or empty.${RESET}"
        sleep 1; user_input; return
    fi

    #Load proper items
    mapfile -t pool < <(grep -vE '^#|^$' "$file")

    #Get box details
    read -p "Enter box size (1-${#pool[@]}): " size
    if ! [[ "$size" =~ ^[0-9]+$ && $size -ge 1 && $size -le ${#pool[@]} ]]; then
        echo -e "${RED}Invalid number. Choose between 1 and ${#pool[@]}.${RESET}"
        sleep 1; user_input; return
    fi

    #Randomly select items and update box
    box_items=($(shuf -n "$size" "$file"))
    echo -e "${GREEN}New random box created ($size items):${RESET}\n${CYAN}${box_items[*]}${RESET}"

    #Make a smooth return to main menu
    echo -e "${YELLOW}Returning to main menu...${RESET}"
    sleep 1; user_input
}










#Reads out options.
user_input(){


echo -e "${BLUE}1. Print List${RESET}\n${BLUE}2. Print Item at Position${RESET}\n${GREEN}3. Add Item${RESET}\n${RED}4. Remove Last Item${RESET}\n${RED}5. Remove Item at Position${RESET}\n${RED}6. Exit${RESET}\n${GREEN}7. Save Box${RESET}\n${YELLOW}8. Load Box${RESET}\n${YELLOW}9. List Saved Boxes${RESET}\n${RED}0. Delete Saved Box${RESET}\n${CYAN}10. Generate Random Box From File${RESET}"
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
	10) generate_random_box ;;
	*) echo "Invalid Option! Please choose a valid number." ;;
esac
}
	
user_input
