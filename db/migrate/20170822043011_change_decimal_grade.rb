class ChangeDecimalGrade < ActiveRecord::Migration[5.0]
  def change
    change_table :grades do |t|
      t.change :grade_value, :decimal, :precision => 64, :scale => 12
      t.change :min_value, :decimal, :precision => 64, :scale => 12
      t.change :max_value, :decimal, :precision => 64, :scale => 12
    end
  end
end
