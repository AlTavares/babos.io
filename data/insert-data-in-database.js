'use strict'
var env = require('../Server/ParseServer/server-config.json').apps[0].env
var Parse = require('parse/node')
Parse.initialize(env.appId)
Parse.serverURL = 'http://localhost:3000/parse'

var data = require('./interactionsLoc.json')
var Interaction = Parse.Object.extend("Interaction");

var interactions = []
for (var index = 0; index < data.length; index++) {
    var element = data[index];
    var interaction = new Interaction();
    for (let prop in element) {
        interaction.set(prop, element[prop])
        interactions.push(interaction)
    }
}

Parse.Object.saveAll(interactions, {
    success: function (objs) {
        console.log(objs.length + ' objects saved')
        // objects have been saved...
    },
    error: function (error) {
        console.log(error)
        // an error occurred...

    }
})