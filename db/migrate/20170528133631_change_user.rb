class ChangeUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.rename :password, :password_digest
    end
  end
end
