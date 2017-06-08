class AddPhoneMahasiswa < ActiveRecord::Migration[5.0]
  def change
    add_column(:mahasiswas, :parent_phone, :string, null:false)
  end
end
