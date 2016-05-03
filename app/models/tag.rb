class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :builds, through: :taggings, source: :taggable, source_type: 'Build'
end
