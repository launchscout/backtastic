#= require ./form_field_view
class Backtastic.Views.CheckBoxView extends Backtastic.Views.FormFieldView
  
  template: JST["templates/check_box_template"]
  
  render: ->
    super
    @$('input').prop("checked", "checked") if @model.get(@field)
    
  updateModel: ->
    @model.set @field, @$("input").attr("checked") == "checked"
