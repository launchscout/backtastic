Backtastic.Validators =

  presence: (options) ->
    message = options.message || "is required"
    (field, value) -> message unless value?.length > 0

  format: (options) ->
    message = options.message || "must match specified format"
    toRegExp = (str) ->
      new RegExp(str.replace(/^\//, "").replace(/\/$/, ""))
    pattern = if _.isRegExp(options?.with) then options?.with else toRegExp(options?.with)
    (field, value) -> message unless value?.match(pattern) or (options.allow_blank and _.isEmpty(value))

  length: (options) ->
    message = options.message || "must be between #{options.minimum} and #{options.maximum} characters"
    (field, value) -> message unless Number(options.minimum) <= value.length <= Number(options.maximum)

Backtastic.Validation =

  classMethods:

    addValidator: (validator, field, options) ->
      @validations or = {}
      @validations[field] or= []
      validator = Backtastic.Validators[validator]?(options)
      @validations[field].push validator if validator

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

Backtastic.applyValidations = (models, validations) ->
  model.validate(validations[name]) for name, model of models
