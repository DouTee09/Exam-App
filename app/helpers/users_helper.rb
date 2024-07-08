module UsersHelper
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.name)
    size = options[:size]
    default_url = "https://www.gravatar.com/avatar/#{gravatar_id}?d=identicon&s=#{size}"
    default_url
  end
end
