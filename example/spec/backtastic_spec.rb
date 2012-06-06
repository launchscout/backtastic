require 'spec_helper'

describe "schema_for" do
  Given(:person_schema) { Backtastic.schema_for(Person) }
  Then { person_schema["first_name"]["type"].should == "string" }
end