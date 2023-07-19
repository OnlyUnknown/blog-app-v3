class AddPostsRefToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :post, references: :posts, index:true
  end
end
