class CreateVote2s < ActiveRecord::Migration
  def change
    create_table :vote2s do |t|
      t.integer :value
      t.references :user, index: true, foreign_key: true
      t.references :votable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
