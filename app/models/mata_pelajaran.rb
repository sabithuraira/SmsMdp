class MataPelajaran < ApplicationRecord
    def self.search(search)
        if search
            where('name LIKE ?', "%#{search}%")
        else
            all
        end
    end
end