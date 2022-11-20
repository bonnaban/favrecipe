class PostTag < ApplicationRecord
  belongs_to :recipe_d
  belongs_to :tag
end
