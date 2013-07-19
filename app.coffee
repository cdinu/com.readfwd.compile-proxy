http    = require 'http'
express = require 'express'
jade    = require 'jade'
stylus  = require 'stylus'
fs      = require 'fs'
port    = process.env.PORT || 5000;

compiler = 
    jade: (what) ->
            fn = jade.compile(what,
              pretty: true
            )
            output = fn({})
    stylus: (what) ->
            stylus(what).render()

app = express()

app.use express.logger()  
app.use express.bodyParser()

app.get '*', (req, res) ->
  help_text = fs.readFileSync 'README.md'
  #res.end markdown.markdown.toHTML(help_text)
  res.end help_text
  
app.post '/jade', (req, res) ->
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "X-Requested-With");
      
  if req.body.what
    res.send compiler.jade req.body.what
  else
    res.status 500
    res.end '<p>Use post variables and place Jade source in the <i>what</i> param</p>.\n'
    
app.post '/stylus', (req, res) ->
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "X-Requested-With");

  if req.body.what
    res.send compiler.stylus req.body.what
  else
    res.status 500
    res.end '<p>Use post variables and place Stylus source in the <i>what</i> param</p>.\n'
    
app.listen port, ()->
  console.log "Listening on " + port