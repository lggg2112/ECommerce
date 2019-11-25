class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :contact_number

      t.timestamps
    end
  end
end
