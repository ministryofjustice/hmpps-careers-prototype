var express = require('express')
var router = express.Router()

// Route index page
router.get('/', function (req, res) {
  res.render('index')
})

// add your routes here

router.get('/vacancies', function (req, res) {
  res.render('vacancies', {
    vacancies: require('./assets/data/vacancies.json'),
    api_key: process.env.GOOGLE_MAPS_API_KEY
  })
})

module.exports = router
