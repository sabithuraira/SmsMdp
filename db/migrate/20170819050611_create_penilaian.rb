class CreatePenilaian < ActiveRecord::Migration[5.0]
  def change
    create_table :kelas_penilaians do |t|
      t.integer :kelas_id
      t.date :tanggal
      t.string :keterangan
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
