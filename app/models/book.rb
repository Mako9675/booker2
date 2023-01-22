class Book < ApplicationRecord
  has_one_attached :profile_image
  belongs_to :user
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      image
    else
      'no_image.jpg'
    end
  end
end
