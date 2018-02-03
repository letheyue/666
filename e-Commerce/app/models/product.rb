class Product < ApplicationRecord

  def self.search(search)
    search = search.downcase.gsub(/\-/, '')
    where("lower(name) LIKE ?  OR lower(price) LIKE ? OR lower(comment) LIKE ?", "%#{search}%", "%#{search}%","%#{search}%")
  end

end
