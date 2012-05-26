class Example.Models.Occupation extends Backbone.Model
  urlRoot: "/occupations"
  
class Example.Collections.OccupationsCollection extends Backbone.Collection
  model: Example.Models.Occupation
  
  url: "/occupations"