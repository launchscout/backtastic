class Foo extends Backbone.Model
  
class FooCollection extends Backbone.Collection
  model: Foo

describe "select field view", ->
  beforeEach ->
    setFixtures "<div id='select_field_view'></div>"
    @person = new Example.Models.Person
      first_name: "bob"
      occupation_id: "2"
    @occupations = new Example.Collections.OccupationsCollection [{id: 1, name: "Fireman"}, {id: 2, name: "Ragpicker"}]
    @selectFieldView = new Backtastic.Views.SelectFieldView
      model: @person
      field: "occupation_id"
      label: "Occupation"
      el: $("#select_field_view")
      collection: @occupations
      parentView: new Example.Views.FormView
    @selectFieldView.render()
  it "renders a value", ->
    expect(@selectFieldView.$("select[name=occupation_id]").val()).toEqual "2"
  it "renders options", ->
    expect(@selectFieldView.$("option").length).toEqual 2
    expect(@selectFieldView.$("option").first()).toHaveText "Fireman"
  it "puts a label on it", ->
    expect(@selectFieldView.$("label[for=occupation_id]")).toExist()
    expect(@selectFieldView.$("label[for=occupation_id]")).toHaveText /Occupation/
