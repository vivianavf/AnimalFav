var clientId = '262674095494-d6avuh0mg5t5kkp5plb2mrc4fiu0hom9.apps.googleusercontent.com';
var apiKey = 'AIzaSyAMsNcwerTZWteM4J1nk_KJjOhWc8a70-E';
var scopes =
  'https://www.googleapis.com/auth/gmail.readonly '+
  'https://www.googleapis.com/auth/gmail.send';

function handleClientLoad() {
gapi.client.setApiKey(apiKey);
window.setTimeout(checkAuth, 1);
}
function checkAuth() {
    gapi.auth.authorize({
      client_id: clientId,
      scope: scopes,
      immediate: true
    }, handleAuthResult);
  }

  function handleAuthClick() {
    gapi.auth.authorize({
      client_id: clientId,
      scope: scopes,
      immediate: false
    }, handleAuthResult);
    return false;
  }

  function handleAuthResult(authResult) {
    if(authResult && !authResult.error) {
      loadGmailApi();
      $('#authorize-button').remove();
      $('.table-inbox').removeClass("hidden");
      $('#compose-button').removeClass("hidden");
    } else {
      $('#authorize-button').removeClass("hidden");
      $('#authorize-button').on('click', function(){
        handleAuthClick();
      });
    }
  }

  function loadGmailApi() {
    gapi.client.load('gmail', 'v1', displayInbox);
  }