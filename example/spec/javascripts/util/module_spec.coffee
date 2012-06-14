FooModule =
  bar: -> "baz"
  
  classMethods:
    wuzza: -> "howdy"
    
class Includee
  
Backtastic.include Includee, FooModule
  
describe "Module", ->
  it "should include module methods", ->
    expect(new Includee().bar()).toEqual "baz"
  it "should add class methods", ->
    expect(Includee.wuzza()).toEqual "howdy"
  