class Backtastic.View extends Backbone.View
  
  render: ->
    @trigger("beforeRender")
    @$el.html @template(@)
    @trigger("rendered")