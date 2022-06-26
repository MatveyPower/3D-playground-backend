const Router = require('express')
const router = new Router()

const {check} = require('express-validator')

const authConroller = require('../conrollers/auth.conroller')

router.post('/registration', [
    check('name', 'Имя пользователя не может быть пустым').notEmpty(),
    check('password', 'Пароль должен быть больше 4 символов').isLength({min: 4}),
    check('login', 'Логин не может быть пустым').notEmpty(),
], authConroller.registration)
router.post('/login', authConroller.login)

module.exports = router