class Person < ActiveRecord::Base
  validates_presence_of :first_name
  validates_format_of :last_name, with: /^S.*/
  belongs_to :occupation
end
