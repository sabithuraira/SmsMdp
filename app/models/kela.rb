class Kela < ApplicationRecord
    belongs_to :mata_pelajaran_rel, class_name: "MataPelajaran", foreign_key: "mata_pelajaran_id"
    belongs_to :dosen_rel, class_name: "Dosen", foreign_key: "dosen_id"

end
