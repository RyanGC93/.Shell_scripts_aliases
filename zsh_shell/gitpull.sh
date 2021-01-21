# = What i want this to do
# 1. list pull request
# 2. create a pull request
# 3. get a pull request


function gitpull(){
	echo "What would you like to do?"
		echo
			options=("List a Pull Request" "Create a Pull Request"  "Get a Pull Request")
			select_option "${options[@]}"
			choice=$?
			value=${options[$choice]}	
	
	
}