class Example.Views.PeopleView extends Backtastic.View
  template: JST["people_view_template"]
  
  constructor: (options)->
    super
    @collection.bind "sync", => @render()