class ReviewsController < ApplicationController
  before_action :find_booking, only: [ :new ]

  def new
    @review = BookingReview.new
  end

  def create
    @review = BookingReview.new(booking_review_params)
    @review.booking = @booking
    @review.save
  end

  private

  def find_booking
    @booking = Booking.find(params[:booking_id])
  end

  def booking_review_params
    params.require(:booking_review).permit(:rating, :content)
  end
end
