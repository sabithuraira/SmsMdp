class CreatePertemuan < ActiveRecord::Migration[5.0]
  def change
    create_table :kelas_pertemuans do |t|
      t.integer :kelas_id
      t.date :tanggal
      t.string :materi
      t.string :keterangan
      t.integer :is_before_uts
      t.integer :is_before_uas
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
