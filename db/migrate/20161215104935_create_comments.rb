class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message
      t.string :rating 

      t.integer :church_id
      t.timestamps
    end

    add_index :comments, :church_id
  end
end
