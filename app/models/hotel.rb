class Hotel < ApplicationRecord
  # belongs_to :user
  has_many :comments
  validates :name, presence: true,
            length: { maximum: 50 }

  def self.get_average_rating(hotelid)
    comments = Comment.where(hotel_id: hotelid)
    sum = 0
    comments.each do |comment|
      sum = sum + comment.rating.to_i
    end
    if comments.size < 1
      0
    else
      sum/comments.size
    end
  end
end
