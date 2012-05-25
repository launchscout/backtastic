class Example.Models.Person extends Backbone.Model
  urlRoot: "/people"
  
class Example.Collections.PeopleCollection extends Backbone.Collection
  model: Example.Models.Person
  
  url: "/people"