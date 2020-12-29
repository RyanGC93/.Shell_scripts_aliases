function quickProj(){
	express --pug $1
	cd $1
	npm install csurf
	sql
	npm i
	npm install dotenv dotenv-cli --save-dev
	touch .env .env.example
	
	echo " set your environment to read from the node environment, NODE_ENV, and port of your process.env"
	echo "
		module.exports = {
		  environment: process.env.NODE_ENV || 'development',
		  port: process.env.PORT || 8080,
		};
	"
	echo "update the ./bin/www file to require the port from your config module and have your application listen to the port from your config module"
	echo "Update start script"
	echo 'update start script >>> start": "nodemon -r dotenv/config ./bin/www"'
}

function seqRC(){
	echo "in root create .sequelizerc file"
	echo "Inside >>>
	- For the config property, connect config to database.js.
	- For the models-path property, connect db to models.
	- For the seeders-path property, connect db to seeders.
	- For the migrations-path property, connect db to migrations
	 "
}