class AddUserRefToCreatures < ActiveRecord::Migration
  def change
    # add_column :creatures, :user, :integer
    add_reference :creatures, :user, index: true, foreign_key: true
  end
end
