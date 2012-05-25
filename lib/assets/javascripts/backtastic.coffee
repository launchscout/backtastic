#= require hamlcoffee
#= require inflection
#= require jquery.serializeObject
#= require_self
#= require_tree .

window.Backtastic = {
  Views: {}
}

window.HAML.context = (ctx) -> ctx
window.HAML.escape = (text) -> text