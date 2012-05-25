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
      
  textField: (options) ->
    @fieldViews[options.field] = new Backtastic.Views.TextFieldView
      parentView: @
      field: options.field
      label: options.label
      model: @model
    "<div data-field='#{options.field}'></div>"
    
  save: (event)->
    @$("input[type='submit']").attr("disabled", "disabled")
    @clearErrors()
    event.preventDefault()
    @model.on "error",  (model, response) => @displayErrors(response)
    @model.save @$("form").serializeObject()
    
  afterSave: ->
    @$el.modal("hide")