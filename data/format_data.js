'use strict'
let fs = require('fs')
let data = []
data = require('./dados.v1.json')
let allRefs = new Set()
let print = console.log

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

/**
 * @param {string} element
 */
function extractMedicines(element) {
    let index = element.lastIndexOf('(')
    if (index == -1) {
        return { text: element.trim(), medicines: [] }
    }
    let text = element.substring(0, index)
    element = element.substring(index).replace(/,/gi, ';').replace(/\(|\)|\./gi, '')
    let medicines = element.split(';').map(toTitleCase)
    print(medicines)
    return { text: text.trim(), medicines: medicines }
}

function toTitleCase(str, separator) {
    if (separator == undefined) {
        separator = ' '
    }
    return str.toLowerCase()
        .trim()
        .split(separator)
        .map(i => i[0].toUpperCase() + i.substring(1))
        .join(separator)
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

function formatRemume() {
    let data = []
    data = require('./remume.json')
    for (var index = 0; index < data.length; index++) {
        let el = data[index]
        let meds = extractMedicines(el.description)
        el.medicines = meds.medicines
        el.description = meds.text
        // print(el)
    }
    let output = JSON.stringify(data, null, 4)
    fs.writeFileSync('remumev2.json', output)

}

function run() {
    console.log('Formatting...')
    // format()
    // saveRefs()
    formatRemume()
    console.log('Finished!')
}

run()