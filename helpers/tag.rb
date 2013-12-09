module Helpers

  def add_tag(tags)
    tags.split(' ').map do |tag|
      Tag.first_or_create(text: tag)
    end
  end
end