class RecipeD < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :materials, dependent: :destroy
  has_many :procedures, dependent: :destroy
  has_many :evaluations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  # 中間テーブルpost_tagsを介してtagsと関連付
  has_many :tags, through: :post_tags
  # 過去一週間の内でいいね数が多い順に表示するメソッドの定義
  has_many :week_likes, -> { where(created_at: ((Time.current.at_end_of_day - 6.day).at_beginning_of_day)..(Time.current.at_end_of_day)) }, class_name: 'Like'

  validates :title, presence: true
  # 料理説明は100文字以内に設定
  validates :explanation, presence: true, length: {maximum: 100}
  validates :time, presence: true
  validates :people, presence: true

  def favorited_by?(user)
    likes.exists?(user_id: user.id)
  end

  accepts_nested_attributes_for :materials, :procedures, allow_destroy: true
end
