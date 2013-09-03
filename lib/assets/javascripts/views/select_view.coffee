class Backtastic.Views.SelectFieldView extends Backtastic.Views.FormFieldView
  
  template: JST["templates/select_field_template"]
    
  render: ->
    super
    @$("select").val @model.get(@field)
    
  updateModel: ->
    @model.set @field, @$("select").val()
  