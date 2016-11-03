class ReviewsController < ApplicationController

  def create
    @hotel = Hotel.find(params[:hotel_id])
    @review = @review.reviews.create(comment_params)
    redirect_to hotel_path(@hotel)
  end

  private
  def comment_params
    params.require(:review).permit(:reviewer, :body, :rating)
  end
end
