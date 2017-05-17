var MsTranslator = require('mstranslator');
// Second parameter to constructor (true) indicates that
// the token should be auto-generated.

// new token API
var client = new MsTranslator({
    api_key: "dfe68a0fd9a64e2f8ace713e6bb91508" // use this for the new token API. 
}, true);

var params = {
    text: 'How\'s it going?'
    , from: 'en'
    , to: 'ja'
};

// Don't worry about access token, it will be auto-generated if needed.
client.translate(params, function(err, data) {
    console.log(data);
});
