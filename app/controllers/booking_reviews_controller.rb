class BookingReviewsController < ApplicationController
  before_action :find_booking, only: [:new,:create]

  def new
    @review = BookingReview.new
    authorize @review
  end

  def create
    @review = BookingReview.new(booking_review_params)
    @review.booking = @booking
    authorize @review
    if @review.save
      redirect_to monprofil_guns_path
    else
      render :new
    end

  end

  private

  def find_booking
    @booking = Booking.find(params[:booking_id])
  end

  def booking_review_params
    params.require(:booking_review).permit(:content, :rating)
  end
end
