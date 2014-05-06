describe("cookieFactory", function(){

  //x makes the test pending
   it("returns a random 15 character string", function(){
    expect(cookieFactory.createToken().length).toEqual(15)

  })

  it("returns a 15 character user token from the dom cookie", function(){
    expect(cookieFactory.getValue('user-token').length).toEqual(15)
  })

  it("creates a new cookie", function(){
    cookieFactory.createCookie(37.780446, -122.405950)
    expect(cookieFactory.getValue('user-Latitude')).toEqual("37.780446")
  })

})