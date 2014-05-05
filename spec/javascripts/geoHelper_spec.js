describe('geoHelper', function(){
  it("calculates the distance between two geo points", function(){
    var location1 = [37.780446, -122.405950]
    var location2 = [37.456906, -122.161077]

    var expectedResult = 26.0624977606811
    expect(geoHelper.calculateDistance(location1[0], location1[1], location2[0], location2[1])).toEqual(expectedResult)
  })

  it("returns true for value within set radius (.5m)", function(){
    expect(geoHelper.inRange([37.795134, -122.413548], [37.796186, -122.407025])).toEqual(true)
  })

  it("returns false for value beyond set radius (.5m)", function(){
    expect(geoHelper.inRange([37.795643, -122.415436], [37.985575, -121.979245])).toEqual(false)
  })
});