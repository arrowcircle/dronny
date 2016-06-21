class Brand < ApplicationRecord
  include Sluggable
  validates :title, presence: true
  mount_uploader :logo, LogoUploader
end
