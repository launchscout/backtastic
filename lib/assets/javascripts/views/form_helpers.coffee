Backtastic.Views.FormHelpers =
  fieldView: (fieldViewClass, options) ->
    fieldView = new fieldViewClass _.extend options,
      parentView: @
      model: @model
    fieldView.toHtml()
    
  dateField: (options) ->
    @fieldView(Backtastic.Views.DateFieldView, options)
    
  textField: (options) ->
    @fieldView(Backtastic.Views.TextFieldView, options)

  checkBoxField: (options) ->
    @fieldView(Backtastic.Views.CheckBoxView, options)
    
  selectField: (options) ->
    @fieldView(Backtastic.Views.SelectFieldView, options)
