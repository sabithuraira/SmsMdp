class KelasPertemuan < ApplicationRecord
    def self.pertemuan(kelas_id)
        @maxp = where('kelas_id=?',kelas_id).maximum("pertemuan_ke")
        if @maxp.blank?
            1
        else
            @maxp + 1
        end
    end
end
