'use strict'
let fs = require('fs')
let data = []
data = require('./datav3.json')
let print = console.log

function format() {
    for (var index = 0; index < data.length; index++) {
        var element = data[index];
        element.name = { "pt" : element.name.trim() }
        element.parts = { "pt" : element.parts.trim() }
        element.interactions = { "pt" : element.interactions.trim() }
        if (!element.precautions) element.precautions = ""
        // if (!element.contraindications) element.contraindications = ""
        // if (!element.warnings) element.warnings = ""
        element.precautions = { "pt" : element.precautions.trim() }
        // element.contraindications = { "pt" : element.contraindications.trim() }
        // element.warnings = { "pt" : element.warnings.trim() }
    }
    let output = JSON.stringify(data, null, 4)
    fs.writeFileSync('interactionsLoc.json', output)
}

function getTextFor(text) {
    // let index = 
}

function run() {
    console.log('Formatting...')
    format()
    // saveRefs()
    // formatRemume()
    console.log('Finished!')
}

run()