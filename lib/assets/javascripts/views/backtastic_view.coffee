class Backtastic.View extends Backbone.View

  attributes: ->
    "data-view-id": @cid
  
  toHtml: ->
    @$el.clone().wrap("<p>").parent().html()
    
  render: ->
    @trigger("beforeRender")
    @$el.html @template(@)
    @trigger("rendered")