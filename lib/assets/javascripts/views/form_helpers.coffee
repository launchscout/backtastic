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

  hiddenField: (options) ->
    @fieldView(Backtastic.Views.HiddenFieldView, options)

  passwordField: (options) ->
    @fieldView(Backtastic.Views.PasswordFieldView, options)

  textArea: (options) ->
    @fieldView(Backtastic.Views.TextAreaView, options)

  radioButton: (options) ->
    @fieldView(Backtastic.Views.RadioButtonView, options)

  submit: (options) ->
    @fieldView(Backtastic.Views.SubmitButtonView, options)
    
  selectField: (options) ->
    @fieldView(Backtastic.Views.SelectFieldView, options)
