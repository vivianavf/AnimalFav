var clientId = '262674095494-d6avuh0mg5t5kkp5plb2mrc4fiu0hom9.apps.googleusercontent.com';
var apiKey = 'AIzaSyAMsNcwerTZWteM4J1nk_KJjOhWc8a70-E';
var scopes =
  'https://www.googleapis.com/auth/gmail.readonly '+
  'https://www.googleapis.com/auth/gmail.send';

function handleClientLoad() {
gapi.client.setApiKey(apiKey);
window.setTimeout(checkAuth, 1);
}
