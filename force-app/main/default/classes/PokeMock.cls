global with sharing class PokeMock implements HttpCalloutMock{
  protected String body;
  protected Integer statusCode;
  
public PokeMock(String body,Integer statusCode) {
      this.body = body;
      this.statusCode = statusCode;
  }    
  
  global HTTPResponse respond(HTTPRequest request) {
      HttpResponse res = new HttpResponse();
      res.setBody(this.body);
      res.setStatusCode(statusCode);
      return res;
  }
}