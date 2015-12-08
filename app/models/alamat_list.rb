class AlamatList < ActiveRecord::Base
  belongs_to :kelurahan_list, foreign_key: :kelurahan_id
end
