class Example.Routers.PeopleRouter extends Backbone.Router
  constructor: ->
    super
    @people = new Example.Collections.PeopleCollection(peopleJson)
    @occupations = new Example.Collections.OccupationsCollection(occupationsJson)
    @people.on "sync", => @navigate "people/list", trigger: true
    @peopleView = new Example.Views.PeopleView(collection: @people, el: $("#people_view"))
    @editPersonView = new Example.Views.EditPersonView(el: $("#edit_person"), occupations: @occupations)
    @showPeople()
    
  routes:
    "people/new": "newPerson"
    "people/list": "showPeople"
    "people/:id/edit": "editPerson"
    
  showPeople: ->
    @peopleView.render()
    @editPersonView.close()
    
  newPerson: ->
    person = new Example.Models.Person
    @people.add person, silent: true
    @editPersonView.edit(person)
  
  editPerson: (id)->
    @editPersonView.edit @people.get(id)
    