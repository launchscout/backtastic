class AddEvilToPeople < ActiveRecord::Migration
  def change
    add_column :people, :evil, :boolean
  end
end
