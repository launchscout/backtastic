class Person < ActiveRecord::Base
  validates_presence_of :first_name
  validates_format_of :last_name, with: /^J.*/, message: "Hey you suck!"
  validates_uniqueness_of :last_name
  # validates_length_of :phone, minimum: 7, maximum: 10
  validates_format_of :birth_date, with: /\d+\-\d+\-\d+/, message: "Date must be MM-DD-YYYY", allow_blank: true
  belongs_to :occupation

end
