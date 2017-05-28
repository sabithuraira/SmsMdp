class AddTimestampsToMp < ActiveRecord::Migration[5.0]
  def change
    add_column(:mata_pelajarans, :created_at, :datetime)
    add_column(:mata_pelajarans, :updated_at, :datetime)
  end
end
