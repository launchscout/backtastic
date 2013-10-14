class Backtastic.View extends Backbone.View

  attributes: ->
    "data-view-id": @cid
  
  toHtml: ->
    @el.outerHTML
    
  render: ->
    @trigger("beforeRender")
    @$el.html @template(@)
    @trigger("rendered")