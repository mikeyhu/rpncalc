express = require 'express'

app = express()
app.use express.static(process.cwd() + '/public')
port = process.env.PORT or 3000

# Start Server
app.listen port, -> console.log "Listening on #{port}\nPress CTRL-C to stop server."