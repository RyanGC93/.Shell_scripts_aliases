


function template(){
	echo -e "What Template Would You Like To Use"
		echo
			options=(
			# "Show Template directory"
			".sequelizerc" 
			".env"
			".gitignore" 
			)
			select_option "${options[@]}"
			choice=$?
		value=${options[$choice]}

		#links to resource

		# if [ $option -eq 0  ]
			# then
			# echo "Dir >>> 'https://github.com/RyanGC93/Templates'"
# 
		# fi

		if [ $value = ".sequelizerc"  ]
			then 
			address='https://raw.githubusercontent.com/RyanGC93/Templates/master/.sequelizerc?token=APP6CHYNHQXWI3IK274XMVK75YDFW'
		fi

		if [ $value = ".env"  ]
			then 
			address='https://raw.githubusercontent.com/RyanGC93/Templates/master/.env?token=APP6CH47ZRIY3BOWVNX6FP275YFAG'
		fi

		if [ $value = ".gitignore"  ]
			then 
			address='https://raw.githubusercontent.com/RyanGC93/Templates/master/.sequelizerc?token=APP6CHYNHQXWI3IK274XMVK75YDFW'
		fi


	echo -e "What would you like to do with the template"
	
		echo
			optionss=(
			"Display in Terminal" 
			"Add to file"
			" " 
			)
			select_option "${optionss[@]}"
			choiceTwo=$?
		values=${options[$choice]}
		# echo "$values"
		# echo "$value"
		# echo "---------------------------"
		# echo "$choiceTwo"
		
		if [ $choiceTwo -eq 0 ];
			then
			# curl $address
			action="curl ${address}"
			echo -e "\e[35mMagenta=============TEMPLATE=============\e[0mNormal"
			eval $action
		fi
		
		if [ $choiceTwo -eq 1 ];
			then
			# action="curl "
			echo "works"
			ls -al
			echo "In what file would you like to add this"
			read fileName
			echo 'adding'
			action="curl ${address} > ${fileName}"
			eval $action
		fi
}
