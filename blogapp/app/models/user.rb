class User < ApplicationRecord
    has_many :posts
    has_many :likes
    has_many :comments

    def self.most_recent(input)
        User.limit(3).order(created_at: :desc).where(name:input)
    end
end