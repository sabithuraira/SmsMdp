class Nilai < ApplicationRecord
    belongs_to :mata_pelajaran_rel, class_name: "MataPelajaran", foreign_key: "mp"
    belongs_to :mahasiswa_rel, class_name: "Mahasiswa" ,foreign_key: "mahasiswa"
    belongs_to :dosen_rel, class_name: "User", foreign_key: "dosen"

    validates :mp, :mahasiswa, :tahun_ajaran, :semester, :nilai, presence: true

    after_save :sync_sms

    private
        def sync_sms
            if self.nilai <= 60
                sms = Outbox.new
                sms.DestinationNumber= self.mahasiswa_rel.parent_phone
                sms.TextDecoded= "Salam, pengumuman nilai dari #{self.mahasiswa_rel.name} matkul #{self.mata_pelajaran_rel.name} #{self.nilai}. Terima kasih"
                sms.CreatorID= "Gammu"
                sms.save
            end
        end
end
