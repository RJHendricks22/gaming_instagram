class Picture < ApplicationRecord
  belongs_to :user
  has_many :comments
  
  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
end
