Backtastic.Views.FormHelpers =
  fieldView: (fieldViewClass, options) ->
    fieldView = new fieldViewClass _.extend options,
      parentView: @
      model: @model
    fieldView.toHtml()
    
  date: (options) ->
    @fieldView(Backtastic.Views.DateView, options)
    
  textField: (options) ->
    @fieldView(Backtastic.Views.TextFieldView, options)

  checkBox: (options) ->
    @fieldView(Backtastic.Views.CheckBoxView, options)
    
  select: (options) ->
    @fieldView(Backtastic.Views.SelectView, options)
