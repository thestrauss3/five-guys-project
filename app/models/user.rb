class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :burgers
  has_many :reviews

  # testing CarrierWave
  mount_uploader :avatar, AvatarUploader

  validates :username, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_confirmation

  def send_confirmation
    UserMailer.signup_confirmation(self).deliver
  end
end
