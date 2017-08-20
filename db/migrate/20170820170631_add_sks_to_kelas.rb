class AddSksToKelas < ActiveRecord::Migration[5.0]
  def change
    add_column(:kelas, :sks, :integer)
  end
end
