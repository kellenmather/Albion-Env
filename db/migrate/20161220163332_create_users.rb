class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :contact_name
      t.string :company
      t.string :company_address
      t.string :city
      t.references :state, foreign_key: true
      t.string :zipcode
      t.string :phone
      t.string :email
      t.string :password_digest
      t.boolean :admin

      t.timestamps
    end
  end
end
