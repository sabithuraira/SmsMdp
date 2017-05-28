class Mahasiswa < ApplicationRecord
    def self.search(search)
        if search
            where('name LIKE ? OR nim LIKE ?', "%#{search}%", "%#{search}%")
        else
            all
        end
    end
end
