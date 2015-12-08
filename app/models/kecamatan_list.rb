class KecamatanList < ActiveRecord::Base
  has_many :kelurahan_lists, dependent: :destroy, foreign_key: :kecamatan_id
end
