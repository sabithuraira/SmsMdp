class CreateKelas < ActiveRecord::Migration[5.0]
  def change
    create_table :kelas do |t|
      t.integer :dosen_id
      t.integer :mata_pelajaran_id
      t.string :tahun_ajaran
      t.string :nama
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
