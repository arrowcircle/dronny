class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable, :trackable#, :confirmable
  mount_uploader :avatar, AvatarUploader

  has_many :builds

  validates_processing_of :avatar
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  def admin?
    return false unless roles.present?
    roles.include?('admin')
  end
end
