class Picture < ApplicationRecord
  belongs_to :user
  has_many :comments
                    
  
  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    large: '600x600>'
  }, :storage => :s3
  
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }
end
