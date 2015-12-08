class ChangeIdListToId < ActiveRecord::Migration
  def change
    rename_column :kelurahan_lists, :kecamatan_list_id, :kecamatan_id
    rename_column :alamat_lists, :kelurahan_list_id, :kelurahan_id
  end
end
