class BoringModel extends Backbone.Model

describe "validation", ->
  beforeEach ->
    BoringModel.validate
      first_name:
        presence: {}
      last_name:
        format:
          with: "/^S.*/"
          message: "Hey, you suck!"
        uniqueness:
          case_sensitive: true
      other_field:
        format:
          with: "/^K.*/"
          allow_blank: true
      phone:
        length:
          minimum: 7
          maximum: 10
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
      it "should use the mesage", ->
        expect(@validationErrors.last_name[0]).toMatch /suck/
    describe "when matching", ->
      beforeEach ->
        @model.set last_name: "Smith"
      it "should validate format", ->
        expect(@validationErrors.last_name).not.toBeDefined()
    describe "when blanks are allowed", ->
      beforeEach ->
        @model.set other_field: ""
      it "allows blanks", ->
        expect(@validationErrors.other_field).not.toBeDefined()

  describe "length", ->
    describe "when not matching", ->
      beforeEach ->
        @model.set phone: "1"
      it "should have errors on phone", ->
        expect(@validationErrors.phone.length).toEqual 1
    describe "when matching", ->
      beforeEach ->
        @model.set phone: "1234567"
      it "should not have errors on phone", ->
        expect(@validationErrors.phone).not.toBeDefined()