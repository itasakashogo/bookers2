
class Book < ApplicationRecord

	belongs_to :user

  validates :title, presence: true
  validates :category,  length: { maximum: 200 }

end

