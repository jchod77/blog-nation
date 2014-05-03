class Post < ActiveRecord::Base
  has_many :tags, through :post_tags
  has_many :comments
  belongs_to :user
end
