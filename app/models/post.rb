class Post < ActiveRecord::Base

  validates :title,   presence: true
  validates :content, presence: true
  validates :name,    presence: true

  validate :flurb_not_in_content
  validate :names_are_proper

  def flurb_not_in_content
    %i(title content).each do |attribute|
      if send(attribute) =~ /fl([aeiou]|\|_\|)rb/i
        errors.add(attribute, "can't include the word \"flurb\" or a variation thereof")
      end
    end
  end

  def names_are_proper
    if name != /()/
      errors.add(name, "isn't a valid name (only letters, spaces, periods, dashes, and commas allowed)")
    end
  end

end
