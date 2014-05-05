describe('geoparseHelper', function(){

  describe('latitude and longitude return functions', function(){
    var room = 'skippers'
    var room_list_path = 'room_list'

    it("returns the correct latitude for a given room Url", function() {
      var expectedLatitude = 37.784926
      var actualLatitude = dummyFirebaseDatabase[room_list_path][room]['location']['latitude']

      expect(actualLatitude).toEqual(expectedLatitude)
    })

    it("returns the correct longitude for a given room Url", function() {
      var expectedLatitude = -122.397446
      var actualLatitude = dummyFirebaseDatabase[room_list_path][room]['location']['longitude']

      expect(actualLatitude).toEqual(expectedLatitude)
    })
  })



  describe('the parsing method returns the appropriate rooms', function() {

    it('returns an ', function() {
      var geoparseHelper = new geoparseHelper()


    })
  })
});