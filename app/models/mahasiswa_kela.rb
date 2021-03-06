class MahasiswaKela < ApplicationRecord
    belongs_to :mahasiswa_rel, class_name: "Mahasiswa", foreign_key: "mahasiswa_id"
    belongs_to :kelas_rel, class_name: "Kela", foreign_key: "kelas_id"

    after_save :set_total_nilai

    def self.by_kelas(id)
        where('kelas_id=?', id)
    end

    def self.by_mahasiswa(id)
        where('mahasiswa_id=?', id)
    end

    def self.sent_absen_info(id)
        datas = by_kelas(id)
        
        datas.each do |row| 
            # puts percentage_absen(row) 
            if(percentage_absen(row)<70)
                sms = Outbox.new
                sms.DestinationNumber= row.mahasiswa_rel.parent_phone
                sms.TextDecoded= "Absen #{row.mahasiswa_rel.name} #{percentage_absen(row)}% kurang 70% dan tidak bisa mengikuti ujian. Terima kasih"
                sms.CreatorID= "Gammu"
                sms.save
            end
        end
    end

    def self.percentage_absen(row)
        # puts row.inspect
        pertemuan = KelasPertemuan.pertemuan(row.kelas_id) - 1
        total_abs=0

        for i in 1..pertemuan
            if row["abs"+i.to_s]==1
                total_abs+=1 
            end
        end


        if total_abs==0
            return 0
        else
            return (total_abs.to_f/pertemuan.to_f*100)
        end
    end

    private
        def set_total_nilai
            if :uas_changed? || :uts_changed? || :quiz_changed? || :tugas_changed?
                if self.uas.present? && self.uts.present? && self.tugas.present? && self.quiz.present?
                    aggregate_nilai = ((self.tugas * 10) + (self.quiz * 20) + (self.uts * 30) + (self.uas * 40))/100
                    grade = "A"

                    # all_grades = Grade.all
                    
                    Grade.all.each do |data_grade|
                        if aggregate_nilai<=data_grade.max_value && aggregate_nilai>=data_grade.min_value
                            grade=data_grade.grade 
                            break    
                        end
                    end
                    
                    self.update_column(:total_nilai, aggregate_nilai)
                    self.update_column(:grade, grade)
                end
            end
        end
    
end
