describe("cookieFactory", function(){

  xit("returns a random 15 character string", function(){
    expect(cookieFactory.createUserToken().length).toEqual(15)
  })

  xit("returns a 15 character user token from the dom cookie", function(){
    expect(cookieFactory.getValue('user-token').length).toEqual(15)
  })

  xit("creates a new cookie", function(){
    cookieFactory.createCookie(37.780446, -122.405950)
    expect(cookieFactory.getValue('user-Latitude')).toEqual("37.780446")
  })

})








///////New testing suite for cookie factory
describe("cookieFactory", function(){

  describe("create user token", function(){

    it("returns a random 15 character string", function(){
      expect(cookieFactory.createUserToken().length).toEqual(15)
    })

  });

  describe("create cookie", function(){
    it("sets document.cookie to cookie string", function(){
      cookieFactory.createCookie("37.780446","-122.405950");
      expect(document.cookie).toMatch(/user-token=[A-Za-z0-9]+:user-Latitude=37\.780446:user-Longitude=-122\.405950/)
    })
  })

  describe("get user token", function(){
    beforeEach(function(){
      document.cookie = "user-token=ABCDEFGHIJKLMNO";
    });

    it("should have a valid user token", function(){
      expect(cookieFactory.getValue('user-token')).toEqual("ABCDEFGHIJKLMNO");
    });

    it("returns a 15 character user token from the dom cookie", function(){
      expect(cookieFactory.getValue('user-token').length).toEqual(15)
    })
  })

  describe("get user latitude", function(){
    it("returns a user latitude value", function(){
      document.cookie = "user-Latitude=37.780446"
      expect(cookieFactory.getValue('user-Latitude')).toEqual("37.780446")

     })
  })

  describe("get user longitude", function(){
    it("creates a new cookie", function(){
      document.cookie = "user-Longitude=-122.405950"
      expect(cookieFactory.getValue('user-Longitude')).toEqual("-122.405950")

     })
  })

});




