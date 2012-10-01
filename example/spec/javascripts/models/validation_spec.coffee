class BoringModel extends Backbone.Model

describe "validation", ->
  beforeEach ->
    BoringModel.validate
      first_name:
        presence: {}
      last_name:
        format:
          with: "/^S.*/"
    @model = new BoringModel
    @validationErrors = {}
    @model.on "error", (model, errors) =>
      @validationErrors = errors
  describe "presence", ->
    describe "when not matching", ->
      beforeEach ->
        @model.set first_name: ""
      it "should validate presence of", ->
        expect(@validationErrors.first_name.length).toEqual 1
    describe "when matching", ->
      beforeEach ->
        @model.set first_name: "Bill"
      it "should validate presence of", ->
        expect(@validationErrors.first_name).not.toBeDefined()
  describe "format", ->
    describe "when not matching", ->
      beforeEach ->
        @model.set last_name: "Not smith"
      it "should validate format", ->
        expect(@validationErrors.last_name.length).toEqual 1
    describe "when matching", ->
      beforeEach ->
        @model.set last_name: "Smith"
      it "should validate format", ->
        expect(@validationErrors.last_name).not.toBeDefined()


