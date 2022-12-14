class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable,
        #パスワードの文字数設定
        password_length: 8..128

  has_one_attached :profile_image
  has_many :recipe_ds, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  # ここから
  #def likes
  #  Like.where(user_id: self.id)
  #end

  #def like_recipe_ds
  #  RecipeD.where(id: self.likes.pluck(:recipe_d_id))
  #end
  # ↓ここまでの記述を一行にまとめて記述している
  has_many :like_recipe_ds, through: :likes, source: :recipe_d
  # ↑like_recipe_dsというアソシエーション用モデルを定義している(名称自由)。
  # 上で定義したlikesを中間テーブルにしてその中でbelongs_toしているrecipe_d
  # のデータをsourceで検索している。

  # ニックネームは2文字以上20文字以内に設定
  validates :nickname, presence: true, length: {minimum: 2, maximum: 20}
  validates :email, presence: true

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
