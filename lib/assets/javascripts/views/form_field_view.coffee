class Backtastic.Views.FormFieldView extends Backtastic.View
  
  constructor: (options)->
    super
    @field = options.field
    @label = options.label
    @parentView = options.parentView
    @parentView.on "rendered", => @afterParentRender()
    @model.on "error", (model, errors) => @displayErrors(errors)
  
  afterParentRender: ->
    @setElement(@parentView.$("[data-view-id=#{@cid}]"))
    @render()
    
  render: ->
    super
    @$el.addClass "control-group"
    
  displayErrors: (errors) ->
    errors = errors.errors if errors.errors
    if errors?[@field]
      messages = errors[@field]
      @$el.addClass "error"
      @$("span.help-inline").remove()
      @$el.append "<span class='help-inline'>#{message}</span>" for message in messages
  
  clearErrors: ->
    @$el.removeClass "error"
