describe "check box view", ->
  beforeEach ->
    setFixtures "<div id='check_box_view'></div>"
    @model = new Example.Models.Thing
    @checkBoxFieldView = new Backtastic.Views.CheckBoxView
      model: @model
      field: "awesome"
      label: "Awesome"
      el: $("#check_box_view")
      parentView: new Example.Views.FormView
    
  describe "when the value is true", ->
    beforeEach ->
      @model.set awesome: true
      @checkBoxFieldView.render()
    it "renders a check box input", ->
      expect(@checkBoxFieldView.$("input[type=checkbox]")).toExist()
    it "renders a checked check box if the value is true", ->
      expect(@checkBoxFieldView.$("input[type=checkbox]").attr("checked")).toEqual("checked")
  
  describe "when value is false", ->
    beforeEach ->
      @model.set awesome: false
      @checkBoxFieldView.render()
    it "render an unchecked check box if the value is false", ->
      expect(@checkBoxFieldView.$("input[type=checkbox]").attr("checked")).toBeFalsy()
      
  describe "updating model", ->
    describe "when checking", ->
      beforeEach ->
        @checkBoxFieldView.render()
        @checkBoxFieldView.$("input").attr("checked", true)
        @checkBoxFieldView.updateModel()
      it "should update the model", ->
        expect(@model.get("awesome")).toBeTruthy()
    describe "when unchecking", ->
      beforeEach ->
        @model.set awesome: true
        @checkBoxFieldView.render()
        @checkBoxFieldView.$("input").attr("checked", false)
        @checkBoxFieldView.updateModel()
      it "should update the model", ->
        expect(@model.get("awesome")).toBeFalsy()

