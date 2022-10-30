class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipe_d, dependent: :destroy
  has_many :comment, dependent: :destroy
  has_many :evaluation, dependent: :destroy

  validates :nickname, presence: true
  validates :birth, presence: true
  validates :gender, presence: true
end
