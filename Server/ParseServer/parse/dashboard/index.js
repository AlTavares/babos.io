'use strict'
var ParseDashboard = require('parse-dashboard');

let serverURL = "http://localhost:3000/parse"
if (process.env.NODE_ENV == 'production') {
  serverURL = 'https://altavares.tk/parse'
}
var dashboard = new ParseDashboard({
  "apps": [
    {
      "serverURL": serverURL,
      "appId": process.env.appId,
      "masterKey": process.env.masterKey,
      "appName": "MyApp"
    }
  ],
  "users": [
    {
      "user": process.env.username,
      "pass": process.env.password
    }
  ]
});

module.exports = dashboard