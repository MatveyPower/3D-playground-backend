const db = require('../db')

class UserConrollers {
    async getUsers(req, res) {
        const users = await db.query('SELECT * FROM person')
        res.json(users.rows)
    }

}

module.exports = new UserConrollers()