class AddIndexToPosts < ActiveRecord::Migration[5.2]
  def change
    add_index :posts, :title, length:32
  end
end
