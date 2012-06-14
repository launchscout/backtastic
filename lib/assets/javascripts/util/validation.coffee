Backtastic.Validators =
  
  presence: (options) ->
    (field, value) -> "is required" unless value?.length > 0
   
  format: (options) ->
    (field, value) -> "must match specified format." unless value?.match(options?.pattern)
    
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
      
  addError: (field, error) ->
    @errors[field] or= []
    @errors[field].push error
    
  clearErrors: -> @errors = {}
  
  validate: (attributes) ->
    @clearErrors()
    return unless @constructor.validations
    for attr, validators of @constructor.validations
      for validator in validators
        error = validator(attr, attributes[attr])
        @addError(attr, error) if error
    @errors if _.keys(@errors).length > 0
    
Backtastic.include Backbone.Model, Backtastic.Validation
