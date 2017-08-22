class CreateGrade < ActiveRecord::Migration[5.0]
  def change
    create_table :grades do |t|
      t.string :grade, :limit => 2, :null =>false
      t.decimal :grade_value, :precision => 2, :scale => 2
      t.decimal :min_value, :precision => 2, :scale => 2
      t.decimal :max_value, :precision => 2, :scale => 2
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
