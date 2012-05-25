#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Example =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  
$ ->
  new Example.Routers.PeopleRouter()
  Backbone.history.start()