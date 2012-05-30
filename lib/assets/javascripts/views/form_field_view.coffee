class Backtastic.Views.FormFieldView extends Backtastic.View
  
  constructor: (options)->
    super
    @field = options.field
    @label = options.label
    @parentView = options.parentView
    @parentView.on "rendered", => @afterParentRender()
  
  afterParentRender: ->
    @setElement(@parentView.$("[data-view-id=#{@cid}]"))
    @render()
    
  render: ->
    super
    @$el.addClass "control-group"
    
  displayErrors: (messages) ->
    @$el.addClass "error"
    @$el.append "<span class='help-inline'>#{message}</span>" for message in messages
  
  clearErrors: ->
    @$el.removeClass "error"
