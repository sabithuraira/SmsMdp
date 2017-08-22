class Grade < ApplicationRecord
    validates :grade, :grade_value, :min_value, :max_value , presence: true
    validates :grade, length: { maximum: 2 }
end
