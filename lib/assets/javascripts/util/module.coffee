moduleKeywords = ['included', 'classMethods']

Backtastic.include = (klass, obj) ->
  for key, value of obj when key not in moduleKeywords
    # Assign properties to the prototype
    klass::[key] = value
  
  if obj.classMethods
    klass[key] = value for key, value of obj.classMethods
      
  obj.included?.apply(klass)
  this