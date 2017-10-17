class CreateTagihan < ActiveRecord::Migration[5.0]
  def change
    create_table :tagihans do |t|
      t.string :tahun_masuk, :limit => 4, :null =>false
      t.decimal :bpp, :precision => 64, :scale => 12
      t.decimal :per_sks, :precision => 64, :scale => 12
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
