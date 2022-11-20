class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  # 中間テーブルpost_tagsを介してrecipe_dsと関連付
  has_many :recipe_ds, through: :post_tags
end
