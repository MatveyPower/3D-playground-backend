const jwt = require('jsonwebtoken')
const {secret} = require('../config')
module.exports = function (roles) {
    return function (req, res, next) {

        if (req.method === 'OPTIONS') {
            next()
        }
    
        try {
            const token = req.headers.autorization.split(' ')[1]
            if (!token) {
                res.status(403).json({message: "Пользователь не авторизован" })
            }
    
            const {roles: userRoles} = jwt.verify(token, secret)
            console.log(typeof userRoles)
            let hasRole = false
            if (userRoles === 'admin') {
                hasRole = true
            }

            if (!hasRole) {
                res.status(403).json({message: "У вас нет прав" })
            }
            next()
        }
    
        catch (e) {
            console.log(e)
    
            res.status(403).json({message: "Пользователь не авторизован" })
        }

    }
}