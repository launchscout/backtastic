#= require hamlcoffee
#= require inflection
#= require jquery.serializeObject
#= require bootstrap-datepicker
#= require backbone_wrap_errors
#= require_self
#= require_directory ./util
#= require_tree .

window.Backtastic = {
  Views: {}
}

window.HAML.context = (ctx) -> ctx
window.HAML.escape = (text) -> text