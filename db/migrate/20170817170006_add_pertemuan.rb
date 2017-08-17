class AddPertemuan < ActiveRecord::Migration[5.0]
  def change
    add_column(:kelas_pertemuans, :pertemuan_ke, :integer)
  end
end
