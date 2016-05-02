class Build < ApplicationRecord

  attr_accessor :tag_line

  has_many :tags, as: :taggable
  after_save :saving_tags

  def tag_list
    tags.map(&:name).join(' ')
  end

  def saving_tags
    self.tags = tag_line.split(' ').map do |tag|
      self.tags.find_or_create_by!(name: tag.strip.downcase)
    end
  end
end
