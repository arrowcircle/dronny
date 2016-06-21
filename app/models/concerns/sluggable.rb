module Sluggable
  extend ActiveSupport::Concern
  included do
    before_validation :set_default_slug
  end

  def set_default_slug
    return if slug.present?
    self.slug = title.to_slug.transliterate(:russian).to_s.parameterize if title.present?
  end
end
