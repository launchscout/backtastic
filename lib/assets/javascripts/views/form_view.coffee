#= require ./form_helpers
class Backtastic.Views.FormView extends Backtastic.View
      
  save: (event)->
    event.preventDefault()
    if @model.set @$("form").serializeObject()
      @$("input[type='submit']").attr("disabled", "disabled")
      @model.save {},
        error: => @$("input[type='submit']").removeAttr("disabled")
        
Backtastic.include Backtastic.Views.FormView, Backtastic.Views.FormHelpers