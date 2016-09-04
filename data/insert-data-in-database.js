'use strict'
var env = require('../Server/ParseServer/server-config.json').apps[0].env
var Parse = require('parse/node')
Parse.initialize(env.appId)
Parse.serverURL = 'http://localhost:3000/parse'
var print = console.log

var interactions = require('./interactionsLoc.json')
var Interaction = Parse.Object.extend("Interaction");
saveData(interactions, Interaction)

var remume = require('./remume.json')
var Remume = Parse.Object.extend("Remume")
saveData(remume, Remume)


function saveData(data, PFObject) {
    let list = []
    for (var index = 0; index < data.length; index++) {
        var element = data[index];
        var pfObject = new PFObject();
        for (let prop in element) {
            pfObject.set(prop, element[prop])
            list.push(pfObject)
        }
    }
    print(list)
    Parse.Object.saveAll(list, {
        success: function (objs) {
            console.log(objs.length + ' objects saved')
            // objects have been saved...
        },
        error: function (error) {
            console.log(error)
            // an error occurred...

        }
    })
}