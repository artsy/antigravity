#
# Fake positron express app
#

_ = require 'underscore'
express = require 'express'
fabricate = require './fabricate'

positron = module.exports = express()

positron.get '/api/articles', (req, res) ->
  res.send { total: 1, count: 1, results: [ fabricate 'article' ] }