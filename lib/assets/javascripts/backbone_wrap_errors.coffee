Backbone.wrapError = (onError, originalModel, options) ->
  (model, resp) ->
    resp = if model == originalModel then resp else model
    errors = if resp.getResponseHeader("Content-Type").match(/json/)
      JSON.parse(resp.responseText)
    else
      resp
    if (onError)
      onError(originalModel, errors, resp, options);
    else
      originalModel.trigger('error', originalModel, errors, resp, options);
