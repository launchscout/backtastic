class Example.Views.EditPersonView extends Backtastic.Views.FormView
  template: JST["edit_person_view_template"]
  
  constructor: (options)->
    super
    @occupations = options.occupations
      
  events:
    "submit form": "save"
    
  render: ->
    super
    @$el.addClass "modal"
    
  edit: (person)->
    @model = person
    @render()
    @$el.modal "show"
  
  close: ->
    @$el.modal "hide"