class ProfileImage < ApplicationRecord
  has_one_attached :profile_image
  belongs_to :user
  
  
  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
end
