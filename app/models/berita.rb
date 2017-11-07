class Berita < ApplicationRecord
    after_save :sync_sms
    
    private
        def sync_sms
            if is_sms
                Mahasiswa.all.each do |data|
                    sms = Outbox.new
                    sms.DestinationNumber= data.parent_phone
                    sms.TextDecoded= informasi
                    sms.CreatorID= "Gammu"
                    sms.save
                end
            end
        end
end
