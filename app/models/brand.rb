class Brand < ApplicationRecord
  validates :title, presence: true
  mount_uploader :logo, LogoUploader
end
