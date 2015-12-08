class CreateKecamatanLists < ActiveRecord::Migration
  def change
    create_table :kecamatan_lists do |t|
      t.string :kecamatan

      t.timestamps
    end
  end
end
