Backtastic.Validators =

  presence: (options) ->
    (field, value) -> "is required" unless value?.length > 0

  format: (options) ->
    toRegExp = (str) ->
      new RegExp(str.replace(/^\//, "").replace(/\/$/, ""))
    pattern = if _.isRegExp(options?.with) then options?.with else toRegExp(options?.with)
    (field, value) -> "must match specified format." unless value?.match(pattern)

Backtastic.Validation =

  classMethods:

    addValidator: (validator, field, options) ->
      @validations or = {}
      @validations[field] or= []
      @validations[field].push Backtastic.Validators[validator]?(options)

    validatePresenceOf: (field) ->
      @addValidator("presence", field)

    validateFormatOf: (field, options) ->
      @addValidator("format", field, options)

    validate: (validations) ->
      @validations = {}
      for field, fieldValidations of validations
        for validationType, options of fieldValidations
          @addValidator(validationType, field, options)

  addError: (field, error) ->
    @errors[field] or= []
    @errors[field].push error

  clearErrors: -> @errors = {}

  validateAttribute: (attribute, value) ->
    return unless @constructor.validations[attribute]
    for validator in @constructor.validations[attribute]
      error = validator(attribute, value)
      @addError(attribute, error) if error

  validate: (attributes) ->
    @clearErrors()
    return unless @constructor.validations
    @validateAttribute(attr, value) for attr, value of attributes
    @errors if _.keys(@errors).length > 0

Backtastic.include Backbone.Model, Backtastic.Validation
