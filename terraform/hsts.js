function handler(event) {
  var response = event.response;
  var headers = response.headers;
  var header_value = "max-age=31536000";

  //Set new headers
  headers['strict-transport-security'] = {'value': `${header_value}`};

  //Return modified response
  return response;
}
