const Router = require('express')
const router = new Router()

const UserConrollers = require('../conrollers/user.controller')

const authMiddleware = require('../middleware/authMiddleware')
const roleMiddleware = require('../middleware/roleMiddleware')

router.get('/users', roleMiddleware(['USER']), UserConrollers.getUsers)


module.exports = router