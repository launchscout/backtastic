describe "Person", ->
  beforeEach ->
    @person = new Example.Models.Person()
  describe "validation", ->
    beforeEach ->
      @validationErrors = {}
      @person.on "error", (model, errors) =>
        @validationErrors = errors
    describe "failing validation", ->
      beforeEach ->
        @person.set first_name: "", last_name: "NotJones"
      it "should not be valid", ->
        expect(@person.isValid()).toBeFalsy()
      it "should have triggered the error event for first name", ->
        expect(@validationErrors.first_name.length).toEqual 1
      it "should have triggered the error event for last name", ->
        expect(@validationErrors.last_name.length).toEqual 1
    describe "with valid attributes", ->
      beforeEach ->
        @person.set first_name: "Fred", last_name: "Jones"
      it "should be valid", ->
        expect(@person.isValid()).toTruthy
      it "should have no errors", ->
        expect(@validationErrors.first_name?).toBeFalsy()
    
      
    