class CreateBerita < ActiveRecord::Migration[5.0]
  def change
    create_table :berita do |t|
      t.string :judul
      t.text :informasi
      t.boolean :is_sms
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
