# If you have questions or bug/improvement ideas lmk and ill address them
- also I am constantly updating this directory so improvements and new scripts will be updated here



# Instructions for the gitlauncher script

### dependencies
1. jq
2. tig

### Steps
1. clone/copy what scripts you want
2. In your shell launcher ie bashrc,etc point to file
- 
```
for f in ~/.bash_scriptsAndAliases/*; do
	# echo "filename: ${f}"
	  [[ -e "${f}" ]] && . "${f}"
done
```
3. In your shell layncher 
```
export GH_USER="<your user name>"
export TOKEN="<your github api o auth token>"
```

4. enjoy!!!!!!!!

example of current version

[Youtube link](https://youtu.be/yjkixPJrmnE)

Also if you liked this repo please start :)