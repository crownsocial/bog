class AddSlugToCreatures < ActiveRecord::Migration
  def change
    add_column :creatures, :slug, :string
  end
end
