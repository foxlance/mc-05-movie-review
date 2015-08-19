class ReviewsController < ApplicationController
	before_action :set_movie
	before_action :set_review, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!

	def new
		@review = Review.new
	end

	def create
		@review = current_user.reviews.build(review_params)
		@review.user_id = current_user.id
		@review.movie_id = @movie.id

		if @review.save
			redirect_to edit_movie_review_path(@movie, @review), notice: 'Your review has been created!'
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		@review = current_user.reviews.find(params[:id])
		@review.update(review_params)

		if @review.save
			redirect_to edit_movie_review_path(@movie, @review), notice: 'Changes to your review has been saved!'
		else
			render 'edit'
		end	
	end


	private

	def review_params
		params.require(:review).permit(:rating, :comment)
	end

	def set_movie
		puts params.inspect
		@movie = Movie.find(params[:movie_id])
	end

	def set_review
		@review = Review.find(params[:id])
	end

end
