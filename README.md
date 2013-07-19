Compiler-proxy
==============

This is small and webservice to compile single `.jade` files to html and single `.stylus`

**Installation**

`git clone git@github.com:cdinu/com.readfwd.compile-proxy.git compile-proxy`

`cd compile-proxy`

`sudo npm install -g coffee-script`

`npm install`


**Running**

`coffee app.coffee`

**Test with**

Replace localhost:5000 with your server

`curl -d 'what=p Hello, world!' http://localhost:5000/jade`

`curl -d "what=body\n    
  margin 3px" http://localhost:5000/stylus`


**Deploy to Heroku**

In the app directory run:

`heroku create`

`heroku config:set PORT=80`

`heroku ps:scale web=1`

After all files are updated and committed in git:

`git push heroku master`