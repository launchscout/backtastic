require 'spec_helper'

describe "rails_validations" do
	Given(:validations) { Backtastic.validations_for(Person) }
  Then { validations[:first_name].should_not be_empty }
  Then { validations[:first_name]["presence"].should == {} }
  Then { binding.pry; validations[:last_name]["format"][:with].should == "/^S.*/"}
end