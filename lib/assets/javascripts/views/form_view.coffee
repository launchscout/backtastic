class Backtastic.Views.FormView extends Backtastic.View
  
  constructor: ->
    super
    @fieldViews = {}
      
  fieldView: (fieldViewClass, options) ->
    fieldView = new fieldViewClass _.extend options, 
      parentView: @
      model: @model
    @fieldViews[options.field] = fieldView
    fieldView.toHtml()
    
  dateField: (options) ->
    @fieldView(Backtastic.Views.DateFieldView, options)
    
  textField: (options) ->
    @fieldView(Backtastic.Views.TextFieldView, options)
    
  selectField: (options) ->
    @fieldView(Backtastic.Views.SelectFieldView, options)
    
  save: (event)->
    @$("input[type='submit']").attr("disabled", "disabled")
    event.preventDefault()
    @model.on "error",  (model, errors) => @$("input[type='submit']").removeAttr("disabled")
    @model.save @$("form").serializeObject()
