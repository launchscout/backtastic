class Example.Routers.PeopleRouter extends Backbone.Router
  constructor: ->
    super
    @people = new Example.Collections.PeopleCollection(peopleJson)
    @people.on "sync", => @navigate "people/list", trigger: true
    @peopleView = new Example.Views.PeopleView(collection: @people, el: $("#people_view"))
    @editPersonView = new Example.Views.EditPersonView(el: $("#edit_person"))
    @showPeople()
    
  routes:
    "people/new": "newPerson"
    "people/list": "showPeople"
    
  showPeople: ->
    @peopleView.render()
    @editPersonView.close()
    
  newPerson: ->
    person = new Example.Models.Person
    @people.add person, silent: true
    @editPersonView.edit(person)
    