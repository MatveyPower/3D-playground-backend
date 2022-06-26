const db = require('../db')
const bcrypt = require('bcryptjs')

const {validationResult} = require('express-validator')

const jwt = require('jsonwebtoken')

const {secret} = require('../config')

const generateAccessToken = (id, roles) => {
    const payload = {
        id,
        roles
    }

    return jwt.sign(payload, secret, {expiresIn: '24h'})
}

class AuthConrollers {
    async registration(req,res) {
        try {
            const errors = validationResult(req)
            if(!errors.isEmpty()) {
                return res.status(400).json({message: 'Ошибка регистрации', errors})
            }
            const {name, login, password} = req.body
            const candidate = await db.query('SELECT * FROM person where login = $1', [login])
            if (candidate.rows[0]) {
                console.log(candidate.rows[0])
                return res.status(400).json({ message: 'Пользователь с таким именен существует'})
            }
            const hashPassword = bcrypt.hashSync(password, 5);
            const person = await db.query(`INSERT INTO person(name, login, password, type) values($1, $2, $3, 'user') RETURNING *`, [name, login, hashPassword])
            return res.json({message: 'Пользователь успешно зарегестрирован'})

        } catch (e) {
            console.log(e)
            res.status(400).json({message:'Ошибка регистрации'})

        }
    }

    async login(req,res) {
        try {   
            const {login, password} = req.body 

            const user = await db.query('SELECT * FROM person where login = $1', [login])
            const userPassword = await db.query('SELECT * FROM person where password = $1', [password])

            console.log(password, user.rows[0].password)
            if (!user.rows[0]) {
                return res.status(400).json({ message: 'Пользователя с таким имененем не существует'})
            }
            const validityPassword = bcrypt.compareSync(password, user.rows[0].password)
            if (!validityPassword) {
                return res.status(400).json({ message: 'Введен неверный пароль'})
            }

            console.log(user, userPassword)

            console.log(validityPassword)

            const token = generateAccessToken(user.rows[0].id, user.rows[0].type)

            console.log(token)

            return res.json({token})

        } catch (e) {
            console.log(e)
            res.status(400).json({message:'Ошибка авторизации'})
        }
    }
}

module.exports = new AuthConrollers()