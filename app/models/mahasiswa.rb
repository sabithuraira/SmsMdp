class Mahasiswa < ApplicationRecord
    def self.search(search)
        if search
            where('name LIKE ? OR nim LIKE ?', "%#{search}%", "%#{search}%")
        else
            all
        end
    end

    def self.subset(id)
        if id
            where.not(id: MahasiswaKela.where(kelas_id: id).select(:mahasiswa_id))
        else
            all
        end
    end
end
