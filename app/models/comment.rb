class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe_d

  validates :comment, presence: true
end
