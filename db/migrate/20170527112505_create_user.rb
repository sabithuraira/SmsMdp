class CreateUser < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.date :date_birth
      t.string :place_birth
      t.timestamps
    end
  end
end
