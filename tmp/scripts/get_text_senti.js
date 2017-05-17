var Mstranslator = require('mstranslator');
var AYLIENTextAPI = require('aylien_textapi');

var client = new Mstranslator({
    api_key: "dfe68a0fd9a64e2f8ace713e6bb91508" // use this for the new token API. 
}, true);
var textapi = new AYLIENTextAPI({
    application_id: "850b357e",
    application_key: "13c1894775d69605d595828b06ed4e9e"
});

var trouble = (process.argv[2] === undefined) ? '試し文' : process.argv[2];
var params = {
    text: trouble
    , from: 'ja'
    , to: 'en'
};
// Don't worry about access token, it will be auto-generated if needed.
client.translate(params, function(err, data) {
    // console.log(data);
    textapi.sentiment({
        'text': data
    }, function(error, response) {
        if (error === null) {
            console.log(response['polarity']);
        }
    });
});

