
function newrepo2(){
	curl -i -H "Authorization: token 318928b02f5b38f8c2264848a7ce972b5a22a8d3" \
	    -d '{ \
	        "name": "$1", \
	        "auto_init": true, \
	        "private": false, \
	      }' \
	    https://api.github.com/user/repos
}


function newrepo (){
      curl -u 'RyanGC93' https://api.github.com/user/repos -d "{\"name\":\"$1\", \"private\": true}"

      git init;
      touch README.md
      echo "# $1" >> README.md
      touch .gitignore
      echo "node-modules/" >> .gitignore
      echo "node-modules/" >> .gitignore
      git add -A
      git commit -m 'first commit'
      git branch -M main
      git remote add origin git@github.com:RyanGC93/$1.git;
      # git push origin main
      git push --set-upstream origin main

      echo "Git Hub Repo Set Up Called: $1"
}