module Sluggable
  extend ActiveSupport::Concern
  included do
    before_validation :set_default_slug
  end

  def set_default_slug
    return if slug.present?
    self.slug = Russian
      .translit(title)
      .tr(' ', '-')
      .gsub(/[^\x00-\x7F]+/, '')
      .gsub(/[^\w_ \-]+/i, '')
      .gsub(/[ \-]+/i, '-')
      .gsub(/^\-|\-$/i, '').downcase if title.present?
  end

  def to_param
    "#{id}-#{slug}"
  end
end
