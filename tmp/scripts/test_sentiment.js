var AYLIENTextAPI = require('aylien_textapi');
var textapi = new AYLIENTextAPI({
    application_id: "850b357e",
    application_key: "13c1894775d69605d595828b06ed4e9e"
});
textapi.sentiment({
    'text': 'John is a very good football player!'
}, function(error, response) {
    if (error === null) {
        console.log(response['polarity']);
    }
});
