class Nilai < ApplicationRecord
    belongs_to :mata_pelajaran_rel, class_name: "MataPelajaran", foreign_key: "mp"
    belongs_to :mahasiswa_rel, class_name: "Mahasiswa" ,foreign_key: "mahasiswa"
    belongs_to :dosen_rel, class_name: "Dosen", foreign_key: "dosen"

    validates :mp, :mahasiswa, :tahun_ajaran, :semester, :nilai, presence: true
end
