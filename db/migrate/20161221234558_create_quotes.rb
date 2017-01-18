class CreateQuotes < ActiveRecord::Migration[5.0]
  def change
    create_table :quotes do |t|
      t.string :name
      t.string :company
      t.string :phone
      t.string :email
      t.text :description

      t.timestamps
    end
  end
end
