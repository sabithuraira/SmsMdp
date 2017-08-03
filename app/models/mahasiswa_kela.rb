class MahasiswaKela < ApplicationRecord
    belongs_to :mahasiswa_rel, class_name: "Mahasiswa", foreign_key: "mahasiswa_id"

    def self.by_kelas(id)
        where('kelas_id=?', id)
    end
end
