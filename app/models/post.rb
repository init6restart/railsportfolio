class Post < ApplicationRecord
  
  validates :title, presence: true, length: { minimum: 5  }
  validates :body, presence: true
  validates :image, presence: true

  has_one_attached :image

end
