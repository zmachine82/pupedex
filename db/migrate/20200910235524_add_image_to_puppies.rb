class AddImageToPuppies < ActiveRecord::Migration[6.0]
  def change
    add_column :puppies, :image, :string
  end
end
