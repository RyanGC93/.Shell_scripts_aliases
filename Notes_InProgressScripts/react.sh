# things thar you nee
# Template


what we need
1. npm install react-router-dom


# create an app
npx create-react-app contact-us-form --template @appacademy/simple --use-npm

function reactlauncher>(){
	echo "??????????????????"
	read repoName
	echo "??????????????????????/"
		echo
			options=("Create react app" "private" )
			select_option "${options[@]}"
			choice=$?
		value=${options[$choice]}
		echo "$value"
		if [ $choice -eq 0 ]
			then 
				echo "npx create-react-app contact-us-form --template @appacademy/simple --use-npm"
		fi
		if [ $choice -eq 1 ]
			then 
				bool="true"
		fi
}
