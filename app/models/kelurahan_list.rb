class KelurahanList < ActiveRecord::Base
  belongs_to :kecamatan_list, foreign_key: :kecamatan_id
  has_many :alamat_lists, dependent: :destroy, foreign_key: :kelurahan_id

  def build_tps
    tps = []
    self.alamat_lists.each do |address|
      tps << {
        alamat: address.alamat,
        no_tps: address.no_tps
      }
    end
    return tps
  end
end
