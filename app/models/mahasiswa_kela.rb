class MahasiswaKela < ApplicationRecord
    belongs_to :mahasiswa_rel, class_name: "Mahasiswa", foreign_key: "mahasiswa_id"

    def self.by_kelas(id)
        where('kelas_id=?', id)
    end

    def self.sent_absen_info(id)
        @datas = by_kelas(id)
        
        @datas.each do |row| 
            if(percentage_absen(row)<70)
                sms = Outbox.new
                sms.DestinationNumber= self.mahasiswa_rel.parent_phone
                sms.TextDecoded= "Absen #{self.mahasiswa_rel.name} matkul #{self.mata_pelajaran_rel.name} #{self.nilai}. Terima kasih"
                sms.CreatorID= "Gammu"
                sms.save
            end
        end
    end

    def self.percentage_absen(row)
        pertemuan = KelasPertemuan.pertemuan(id)
        total_abs=0;

        for i in 1..pertemuan
            total_abs=row["abs"+i]
        end

        if(total_abs==0)
            return 0
        else
            return (total_abs/pertemuan*100)
        end
    end
end
