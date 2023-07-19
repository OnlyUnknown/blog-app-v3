class AddPostsRefToComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :post, references: :posts, index:true
  end
end
