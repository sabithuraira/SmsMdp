class CreateMataPelajaran < ActiveRecord::Migration[5.0]
  def change
    create_table :mata_pelajarans do |t|
      t.string :name
    end
  end
end
