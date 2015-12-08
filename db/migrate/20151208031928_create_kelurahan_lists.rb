class CreateKelurahanLists < ActiveRecord::Migration
  def change
    create_table :kelurahan_lists do |t|
      t.references :kecamatan_list
      t.string :kelurahan

      t.timestamps
    end
    add_index :kelurahan_lists, :kecamatan_list_id
  end
end
