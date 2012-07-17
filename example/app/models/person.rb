class Person < ActiveRecord::Base
  validates_presence_of :first_name
  
  belongs_to :occupation
end
