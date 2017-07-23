class CreateMahasiswaKelas < ActiveRecord::Migration[5.0]
  def change
    create_table :mahasiswa_kelas do |t|
      t.integer :mahasiswa_id
      t.integer :kelas_id
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
