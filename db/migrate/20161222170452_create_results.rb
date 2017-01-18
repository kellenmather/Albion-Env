class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.string :attachment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
