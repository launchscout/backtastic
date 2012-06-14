class Example.Models.Person extends Backbone.Model
  urlRoot: "/people"
  
  @validatePresenceOf "first_name"
  
  @validateFormatOf "last_name", pattern: /^J.*/
  
class Example.Collections.PeopleCollection extends Backbone.Collection
  model: Example.Models.Person
  
  url: "/people"