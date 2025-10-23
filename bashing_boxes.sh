#!/bin/bash
Frost=("Tie" "Menu" "Umbrela" "Dish" "Flame" "Padlock" "Shampoo" "Egg" "Shield" "Nachos")

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

bashingbox6()
{
exit
}











echo "1. Print List"
echo "2. Print Item at Position"
echo "3. Add Item"
echo "4. Remove Last Item"
echo "5. Remove Item at Position"
echo "6. Exit"
read -p "Choose an option: " choice
if [[ $choice == "1" ]]; then
	bashingbox
elif [[ $choice == "2" ]]; then
	bashingbox2
elif [[ $choice == "3" ]]; then
	bashingbox3
elif [[ $choice == "4" ]]; then
	bashingbox4
elif [[ $choice == "5" ]]; then
	bashingbox5
elif [[ $choice == '6' ]]; then
	bashingbox6
else 
	echo "Could Not Proceed With Command"
fi 	
	
	
