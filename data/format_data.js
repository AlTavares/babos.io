'use strict'
let fs = require('fs')
let data = []
data = require('./dados.v1.json')
let allRefs = new Set()

function Reference() {
    this.name = ''
    this.scientificName = ''
    this.family = ''
    this.parts = ''
    this.interactions = ''
    this.precautions = ''
}

function format() {
    for (var index = 0; index < data.length; index++) {
        var element = data[index];
        element.references = new Reference()
        for (let prop in element) {
            if (prop == 'references') { continue }
            let refs = extractReferences(element[prop])
            element.references[prop] = refs
        }
        // console.log(element.references)
    }
    console.log(allRefs.size)
}

/**
 * @param {string} element
 */
function extractReferences(element) {
    return element.replace(/[()]/g, '').split('\n').pop().split(';').map(trimAndAddToSet)
}

function trimAndAddToSet(string) {
    let s = string.trim()
    allRefs.add(s)
    return s
}

function saveRefs() {
    fs.writeFileSync('references.json', JSON.stringify(allRefs, null, 4))
}

function run() {
    format()
    saveRefs()
}