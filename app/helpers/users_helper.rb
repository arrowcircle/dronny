module UsersHelper

  def avatar_for(user, options = { size: 80 })
    return image_tag(user.avatar.thumb, alt: user.name, class: "avatar") if user.avatar.present?
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: user.name, class: "avatar")
	end

end
