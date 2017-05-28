class CreateDosen < ActiveRecord::Migration[5.0]
  def change
    create_table :dosens do |t|
      t.string :name
      t.string :nim
      t.date :date_birth
      t.string :place_birth
      t.timestamps
    end
  end
end
