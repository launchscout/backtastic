describe "EditPersonView", ->
  beforeEach ->
    setFixtures("<div id='edit_person'></div>")
    @person = new Example.Models.Person
    @occupations = new Example.Collections.OccupationsCollection [
      {id: 1, name: "Doctor"}
      {id: 1, name: "Lawyer"}
    ]
    @editPersonView = new Example.Views.EditPersonView
      el: $("#edit_person")
      model: @person
      occupations: @occupations
    @editPersonView.render()
  it "renders fields", ->
    expect(@editPersonView.$("input[name='first_name']")).toExist()
    expect(@editPersonView.$("select[name='occupation_id']")).toExist()
    expect(@editPersonView.$("input[name='evil'][type=checkbox]")).toExist()
  describe "saving", ->
    beforeEach ->
      jasmine.Ajax.useMock()
      @editPersonView.$("input[name='first_name']").val("Bob")
      @editPersonView.$("input[name='last_name']").val("Villa")
      @editPersonView.save(new jQuery.Event)
      @request = mostRecentAjaxRequest()
    it "disables the save button", ->
      expect(@editPersonView.$("input[type='submit']").attr("disabled")).toEqual "disabled"
    describe "an error response", ->
      beforeEach ->
        @request.response
          status: 422
          contentType: "application/json; charset=utf-8"
          responseText: JSON.stringify
            errors:
              first_name: ["cannot be Bob"]
      it "should add the error class", ->
        expect(@editPersonView.$("div.error")).toExist()
      it "should reenable the button", ->
        expect(@editPersonView.$("input[type='submit']").attr("disabled")).toBeFalsy()
      it "should display the error message", ->
        expect(@editPersonView.$el).toHaveText /cannot be Bob/