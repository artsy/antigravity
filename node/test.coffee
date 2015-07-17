{ fabricate, server, positronServer } = require '../'
server.listen 5000, -> console.log 'listening on 5000'
positronServer.listen 5001, -> console.log 'positron listening on 5001'
console.log fabricate 'artwork', title: 'Andy Foobar Masterpiece'