describe "example form view", ->
  beforeEach ->
    setFixtures "<div id='example_form_view'></div>"
    @model = new Example.Models.Thing
      name: "bob"
    @formView = new Example.Views.FormView
      model: @model
      el: $("#example_form_view")
    @formView.render()
  it "renders text fields", ->
    expect(@formView.$("input[name=name]")).toExist()
    expect(@formView.$("input[name=name]").val()).toEqual "bob"    