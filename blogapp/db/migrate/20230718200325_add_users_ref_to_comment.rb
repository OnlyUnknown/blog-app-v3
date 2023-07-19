# frozen_string_literal: true

class AddUsersRefToComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :author, references: :users, index: true
  end
end
