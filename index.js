const express = require("express")
const mapRouter = require("./routes/map.routes")
const userRouter = require("./routes/user.routes")
const authRouter = require("./routes/auth.controller")

const cors = require("cors")

const PORT = process.env.PORT || 8080

const app = express()

app.use(cors())

app.use(express.json())
app.use("/api", mapRouter)
app.use("/api", userRouter)
app.use("/api", authRouter)

app.listen(PORT, () => console.log(`server start on ${PORT}`))
