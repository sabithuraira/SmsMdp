class CreateNilai < ActiveRecord::Migration[5.0]
  def change
    create_table :nilais do |t|
      t.integer :dosen
      t.integer :mp
      t.string :mahasiswa
      t.string :tahun_ajaran
      t.integer :semester
      t.decimal :nilai, :precision=>64, :scale=>12
      t.timestamps
    end
  end
end
