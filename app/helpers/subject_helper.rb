require 'digest/md5'

module SubjectHelper
  def gravatar_for_subject(subject, options = { size: 80 })
    return unless subject && subject.name

    size = options[:size]
    gravatar_id = Digest::MD5.hexdigest(subject.name.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    gravatar_url
  end

  def introduction_for(subject)
    Faker::Lorem.paragraph(sentence_count: 5)
  end
end
