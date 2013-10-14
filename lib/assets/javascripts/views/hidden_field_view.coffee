class Backtastic.Views.HiddenFieldView extends Backtastic.Views.FormFieldView
  tagName: 'span'

  template: JST["templates/hidden_field_template"]

  render: ->
    @$el.html @template(@)
  
