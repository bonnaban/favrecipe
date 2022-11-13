class RecipeD < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :materials, dependent: :destroy
  has_many :procedures, dependent: :destroy
  has_many :evaluations, dependent: :destroy

  validates :title, presence: true
  validates :explanation, presence: true
  validates :time, presence: true
  validates :people, presence: true

  accepts_nested_attributes_for :materials, :procedures, allow_destroy: true
end
