class Build < ApplicationRecord
  include Sluggable
  validates :title, presence: true, length: { maximum: 250 }
end
