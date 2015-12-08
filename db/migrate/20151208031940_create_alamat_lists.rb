class CreateAlamatLists < ActiveRecord::Migration
  def change
    create_table :alamat_lists do |t|
      t.string :alamat
      t.references :kelurahan_list
      t.string :no_tps

      t.timestamps
    end
    add_index :alamat_lists, :kelurahan_list_id
  end
end
