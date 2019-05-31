class Resource < ApplicationRecord
  def self.search(search)
    # Searches title and content for keyword
    where("lower(content_page) LIKE ? or lower(title) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%")
  end
end
