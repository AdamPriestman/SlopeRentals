class RemoveLocationFromListing < ActiveRecord::Migration[7.1]
  def change
    remove_column :listings, :location, :string
  end
end
