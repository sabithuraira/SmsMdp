class UpdateUser < ActiveRecord::Migration[5.0]
  def change
    add_column(:users, :level_access, :string)
  end
end
