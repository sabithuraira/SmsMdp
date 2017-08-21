class AddTotalToMk < ActiveRecord::Migration[5.0]
  def change
    add_column(:mahasiswa_kelas, :total_nilai, :decimal, :precision => 64, :scale => 12)
  end
end
