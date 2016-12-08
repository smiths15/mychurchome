class CreateChurches < ActiveRecord::Migration
  def change
    create_table :churches do |t|
      t.string :name
      t.string :address
      t.text :description
      t.text :weblink


      t.timestamps
    end
  end
end
