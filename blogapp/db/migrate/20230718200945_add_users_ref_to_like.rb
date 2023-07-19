class AddUsersRefToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :author, references: :users, index: true
  end
end
