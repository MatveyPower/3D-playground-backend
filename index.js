const express = require('express')
const mapRouter = require('./routes/map.routes')

const PORT = process.env.PORT || 8080

const app = express()
app.use(express.json())
app.use('/api', mapRouter)

app.listen(PORT, () => console.log(`server start on ${PORT}`))