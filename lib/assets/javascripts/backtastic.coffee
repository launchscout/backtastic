#= require hamlcoffee
#= require inflection
#= require jquery.serializeObject
#= require bootstrap-datepicker
#= require_self
#= require_tree .

window.Backtastic = {
  Views: {}
}

window.HAML.context = (ctx) -> ctx
window.HAML.escape = (text) -> text