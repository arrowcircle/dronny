class Build < ApplicationRecord

  attr_accessor :tag_line

  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings

  after_save :saving_tags, if: :has_tags

  def tag_list
    tags.map(&:name).join(' ')
  end

  def saving_tags
    self.tags = tag_line.split(' ').map do |tag|
      Tag.find_or_create_by!(name: tag.strip.downcase)
    end
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).builds
  end

  private
    def has_tags
      tag_line.present?
    end
end
