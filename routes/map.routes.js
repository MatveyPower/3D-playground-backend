const Router = require('express')
const router = new Router()

const MapsConroller = require('../conrollers/maps.conroller')

router.post('/map', MapsConroller.createMap)
router.get('/maps', MapsConroller.getMaps)
router.get('/maps/:id', MapsConroller.getOneMap)
router.put('/map', MapsConroller.updateMap)
router.delete('/map/:id', MapsConroller.deleteMap)



module.exports = router