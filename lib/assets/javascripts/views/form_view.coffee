class Backtastic.Views.FormView extends Backtastic.View
  
  constructor: ->
    super
    @fieldViews = {}
    
  clearErrors: ->
    fieldView.clearErrors() for field, fieldView of @fieldViews
  
  displayErrors: (response)->
    @$("input[type='submit']").removeAttr("disabled")
    errors = JSON.parse(response.responseText)
    errors = errors.errors if errors.errors #rails does it this way
    for field, errorMessages of errors
      @fieldViews[field]?.displayErrors(errorMessages)
  
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
    @clearErrors()
    event.preventDefault()
    @model.on "error",  (model, response) => @displayErrors(response)
    @model.save @$("form").serializeObject()
