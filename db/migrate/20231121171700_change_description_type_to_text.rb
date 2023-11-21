class ChangeDescriptionTypeToText < ActiveRecord::Migration[7.1]
  def change
    change_column :listings, :description, :text
  end
end
