class Tagihan < ApplicationRecord
    def self.search(search)
        if search
            where('tahun_masuk LIKE ?', "%#{search}%")
        else
            all
        end
    end
end
