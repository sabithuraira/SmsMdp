class Outbox < ApplicationRecord
    self.table_name = "outbox"
    
    def self.search(search)
        if search
            where('Text LIKE ? OR DestinationNumber LIKE ?', "%#{search}%", "%#{search}%")
        else
            all
        end
    end
end
