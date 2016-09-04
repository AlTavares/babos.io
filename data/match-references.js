'use strict'

var references = require('./references.json')
var text = require('./referenceText.json')

for (var i = 0; i < references.length; i++) {
    var element = references[i];
    let abr = element.ref.replace(',', '').replace('.', '').replace('&', '').split(' ')

    console.log(abr)
    for (var j = 0; j < text.length; j++) {
        var refText = text[j];
        var refTokens = refText.replace(',', '').replace('.', '').replace('&', '').split(' ')
        for (var k = 0; k < abr.length; k++) {
            var word = abr[k]
            if (word.length < 3) {
                continue
            }
            if (refTokens.indexOf(word) < 0) {
                break
            }
            element.text = refText
        }
    }
}

var fs = require('fs')
let output = JSON.stringify(references, null, 4)
fs.writeFileSync('fullRef.json', output)