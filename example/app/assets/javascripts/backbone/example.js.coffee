#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers
#= require ./rails_metadata

window.Example =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  
$ ->
  new Example.Routers.PeopleRouter()
  Backbone.history.start()