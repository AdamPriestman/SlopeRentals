class AddDescriptionColumnToListingTable < ActiveRecord::Migration[7.1]
  def change
    add_column :listings, :description, :string
  end
end
