const db = require('../db')

function convertedMapForJSON(rows) {
    return rows.map((map) => {
        return {
            ...map,
            structure: JSON.parse(map.structure.replaceAll('\\', ''))
        }
    })
}

class MapsConroller {
    
    async createMap(req, res) {
        const {name, structure} = req.body
        const newMap = await db.query(`INSERT INTO map(name, structure) values ($1, $2) RETURNING *`, [name, structure])
        newMap.rows[0].structure = JSON.parse(newMap.rows[0].structure.replaceAll('\\', ''))
        res.json(newMap.rows[0])
    }


    async getMaps(req, res) {
        const maps = await db.query('SELECT * FROM map')
        const returningMaps = convertedMapForJSON(maps.rows)
        res.json(returningMaps)
    }

    async getOneMap(req, res) {
        const id = req.params.id
        const map = await db.query('SELECT * FROM map where id = $1', [id])
        const returningMaps = await convertedMapForJSON(map.rows)

        res.json(returningMaps)
    }

    async updateMap(req, res) {
        const {structure, name} = req.body
        const map = await db.query('UPDATE map set structure = $1 where name = $2 RETURNING *', [structure, name])
        const returningMap = await convertedMapForJSON(map.rows)
        res.json(returningMap)
    }

    async deleteMap(req, res) {
        const id = req.params.id
        const map = await db.query('DELETE FROM map where id = $1', [id])
        const returningMaps = await convertedMapForJSON(map.rows)

        res.json(returningMaps)
    }
}

module.exports = new MapsConroller()