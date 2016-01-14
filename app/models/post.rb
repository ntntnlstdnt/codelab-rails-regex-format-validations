class Post < ActiveRecord::Base

  validates :title,   presence: true
  validates :content, presence: true
  validates :name,    presence: true

  validate :flurb_not_in_content

  validates :name, format: {
    with: /\A(\p{L}|(\s|-|\.|,))+\z/,
    allow_blank: true,
    message: "isn't a valid name (only letters, spaces, periods, dashes, and commas allowed)"
    }


  def flurb_not_in_content
    %i(title content).each do |attribute|
      if send(attribute) =~ /fl([aeiou]|\|_\|)rb/i
        errors.add(attribute, "can't include the word \"flurb\" or a variation thereof")
      end
    end
  end




end
