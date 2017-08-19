class KelasPenilaian < ApplicationRecord
    def self.by_kelas(id)
        where('kelas_id=?', id)
    end
end
