#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers
#= require rails_validations

window.Example =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

$ ->
  new Example.Routers.PeopleRouter()
  Backbone.history.start()
  Backtastic.Rails.applyValidations(Example.Models)