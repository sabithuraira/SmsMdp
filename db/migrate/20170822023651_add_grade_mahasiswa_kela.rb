class AddGradeMahasiswaKela < ActiveRecord::Migration[5.0]
  def change
    add_column(:mahasiswa_kelas, :grade, :string, :limit => 2)
  end
end
