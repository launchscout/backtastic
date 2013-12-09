#= require ./form_field_view
class Backtastic.Views.DateView extends Backtastic.Views.FormFieldView
  
  template: JST["templates/text_field_template"]
  
  constructor: (options) ->
    super
    @format = options.format
    
  render: ->
    super
    @$("input").datepicker(format: @format)
