describe('geoHelper', function(){
  it("creates a string that is 15 characters long", function(){
    expect(geoHelper.randomizeString().length).toEqual(15)
  });

  it("creates a random string", function(){
    var count = 0
    var strings = []
    while(count < 10) {
      strings.push(geoHelper.randomizeString())
      count++
    }

    expect(strings).not.toContain(geoHelper.randomizeString())
  })
});