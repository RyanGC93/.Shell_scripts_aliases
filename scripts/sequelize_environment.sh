
#====================================
	 # Sequelize
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
	echo $choice

	if [ $choice -eq 0 ]
		then
		# clear
		echo "INSTALLING DEPENDENCIES"
		npm i --quiet pg sequelize sequelize-cli

	elif [ $choice -eq 10 ]
		then
		# clear
		echo "What's the name of Model (Capital/Single)"
		read modelName
		echo "What are the model attributes?"
		read attributes
		clr
		npx $1 sequelize model:generate --name $modelName --attributes $attributes
					
	elif [ $choice -eq 11 ]
		# clear
		then
		echo "What's the name of the seeder file?"
		read response
		clr
		npx sequelize seed:generate --name $response						
	else
		eval $1 $value
	fi	
}
	