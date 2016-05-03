module Taggable
  extend ActiveSupport::Concern
  included do
    has_many :taggings, dependent: :destroy, as: :taggable
    has_many :tags, through: :taggings

    attr_accessor :tag_line
    after_save :saving_tags, if: :tags?
  end

  def tag_list
    tags.map(&:name).join(' ')
  end

  def saving_tags
    self.tags = tag_line.split(' ').map do |tag|
      Tag.find_or_create_by(name: tag.strip.downcase)
    end
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).builds
  end

  def self.search(query)
    joins(:tag).where(name: query)
  end

  private
  def tags?
    tag_line.present?
  end
end
