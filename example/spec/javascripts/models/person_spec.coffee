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
      it "should have triggered the error event for first name", ->
        expect(@validationErrors.first_name.length).toEqual 1
      it "should have triggered the error event for last name", ->
        expect(@validationErrors.last_name.length).toEqual 1
    describe "with only one attribute", ->
      beforeEach ->
        @person.set last_name: "Jones"
      it "should only validate attributes that being set", ->
        expect(@person.isValid()).toBeTruthy()
      it "should have set the last name", ->
        expect(@person.get("last_name")).toEqual "Jones"
    describe "with valid attributes", ->
      beforeEach ->
        @person.set first_name: "Fred", last_name: "Jones"
      it "should be valid", ->
        expect(@person.isValid()).toTruthy
      it "should have no errors", ->
        expect(@validationErrors.first_name?).toBeFalsy()


