class CreateAbsensis < ActiveRecord::Migration[5.0]
  def change
    create_table :absensis do |t|
      t.integer :mahasiswa_id
      t.integer :kelas_id
      t.integer :pertemuan_ke
      t.integer :flag
      t.string :keterangan
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
