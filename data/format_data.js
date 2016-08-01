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
            element.references[prop] = refs.refs
            element[prop] = refs.text
        }
    }
    let output = JSON.stringify(data, null, 4)
    // console.log(output)
    fs.writeFileSync('datav2.json', output)
}

/**
 * @param {string} element
 */
function extractReferences(element) {
    let index = element.lastIndexOf('(')
    let text = element.substring(0, index)
    let refs = element.substring(index).split(';').map(trimAndAddToSet)
    console.log(element, '\n', refs)
    return { text: text, refs: refs }
}

function trimAndAddToSet(string) {
    let s = string.replace(/[()]/g, '').trim()
    allRefs.add(s)
    return s
}

function saveRefs() {
    let array = [...allRefs].sort()
    let output = JSON.stringify(array, null, 4)
    fs.writeFileSync('references.json', output)
}

function run() {
    console.log('Formatting...')
    format()
    saveRefs()
    console.log('Finished!')
}

run()