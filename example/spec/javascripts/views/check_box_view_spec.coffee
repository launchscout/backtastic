describe "check box view", ->
  beforeEach ->
    setFixtures "<div id='check_box_view'></div>"
    @model = new Example.Models.Thing(awesome: true)
    @checkBoxFieldView = new Backtastic.Views.CheckBoxView
      model: @model
      field: "awesome"
      label: "Awesome"
      el: $("#check_box_view")
      parentView: new Example.Views.FormView
    @checkBoxFieldView.render()
    
  it "renders a check box input", ->
    expect(@checkBoxFieldView.$("input[type=checkbox]")).toExist()
    
  it "renders a checked check box if the value is true", ->
    expect(@checkBoxFieldView.$("input[type=checkbox]").attr("checked")).toEqual("checked")
    
