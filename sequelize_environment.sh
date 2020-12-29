#!usr/bin/bash
#=========================
#	sequelize enviroment
#=========================


#====================================
	 #Creates an Options Selector
#====================================
#   Arguments   : list of options, maximum of 256
#                 "opt1" "opt2" ...
#   Return value: selected index (0 for opt1, 1 for opt2 ...)
function select_option {

    # little helpers for terminal print control and key input
    ESC=$( printf "\033")
    cursor_blink_on()  { printf "$ESC[?25h"; }
    cursor_blink_off() { printf "$ESC[?25l"; }
    cursor_to()        { printf "$ESC[$1;${2:-1}H"; }
    print_option()     { printf "   $1 "; }
    print_selected()   { printf "  $ESC[7m $1 $ESC[27m"; }
    get_cursor_row()   { IFS=';' read -sdR -p $'\E[6n' ROW COL; echo ${ROW#*[}; }
    key_input()        { read -s -n3 key 2>/dev/null >&2
                         if [[ $key = $ESC[A ]]; then echo up;    fi
                         if [[ $key = $ESC[B ]]; then echo down;  fi
                         if [[ $key = ""     ]]; then echo enter; fi; }

    # initially print empty new lines (scroll down if at bottom of screen)
    for opt; do printf "\n"; done

    # determine current screen position for overwriting the options
    local lastrow=`get_cursor_row`
    local startrow=$(($lastrow - $#))

    # ensure cursor and input echoing back on upon a ctrl+c during read -s
    trap "cursor_blink_on; stty echo; printf '\n'; exit" 2
    cursor_blink_off

    local selected=0
    while true; do
        # print options by overwriting the last lines
        local idx=0
        for opt; do
            cursor_to $(($startrow + $idx))
            if [ $idx -eq $selected ]; then
                print_selected "$opt"
            else
                print_option "$opt"
            fi
            ((idx++))
        done

        # user key control
        case `key_input` in
            enter) break;;
            up)    ((selected--));
                   if [ $selected -lt 0 ]; then selected=$(($# - 1)); fi;;
            down)  ((selected++));
                   if [ $selected -ge $# ]; then selected=0; fi;;
        esac
    done

    # cursor position back to normal
    cursor_to $lastrow
    printf "\n"
    cursor_blink_on

    return $selected
}
#====================================
	 # Add collaborator
#====================================
function sql(){
echo "What Would you like to do?"
echo
    options=(
    "Install Dependencies"
    "npx sequelize db:migrate "
    # "sequelize db:migrate:schema:timestamps:add"
    # "sequelize db:migrate:status"
    "npx sequelize db:migrate:undo"
    "npx sequelize db:migrate:undo:all"
    # "sequelize db:seed"
    "npx sequelize db:seed:undo"
    "npx sequelize db:seed:all"
    "npx sequelize db:seed:undo:all "
    "npx sequelize db:create"
    "npx sequelize db:drop"
    "npx sequelize init "
    # "sequelize init:config"
    # "sequelize init:migrations"
    # "sequelize init:models"
    # "sequelize init:seeders "
    # "sequelize migration:generate "
    "npx sequelize model:generate "
    "npx sequelize seed:generate")
    select_option "${options[@]}"
	choice=$?
	value=${options[$choice]}

	if [ $choice -eq 0 ]
		then
		clear
		echo "INSTALLING DEPENDENCIES"
		npm i --quiet pg sequelize sequelize-cli

	elif [ $choice -eq 10 ]
		then
		clear
		echo "What's the name of Model (Capital/Single)"
		read modelName
		echo "What are the model attributes?"
		read attributes
		clr
		npx sequelize model:generate --name $modelName --attributes $attributes
					
	elif [ $choice -eq 11 ]
		clear
		then
		echo "What's the name of the seeder file?"
		read response
		clr
		npx sequelize seed:generate --name $response
		exit						
	else
		eval $value
	fi	
}
	