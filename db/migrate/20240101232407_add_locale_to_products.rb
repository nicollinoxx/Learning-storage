class AddLocaleToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :locale, :string
  end
end
