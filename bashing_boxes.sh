#!/bin/bash
Frost=("Tie" "Menu" "Umbrela" "Dish" "Flame" "Padlock" "Shampoo" "Egg" "Shield" "Nachos")

bashingbox()
{
echo "${Frost[@]}"
}

bashingbox2()
{

}

bashingbox3()
{
echo "What Do You Want To Call The Item?"
read ItemNew
Frost+=("$ItemNew")
}

bashingbox4()
{

}

bashingbox5()
{

}

bashingbox6()
{

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
fi 	
	
	
