class MoviesController < ApplicationController
	before_action :set_movie, only: [:edit, :update, :show, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@movies = Movie.all().order('created_at DESC')	
	end

	def new
		@movie = current_user.movies.new
	end

	def create
		@movie = current_user.movies.build(movie_params)

		if @movie.save
			redirect_to @movie, notice: 'Movie was successfully created!'
		else
			render 'new'
		end
	end

	def search
		if params[:search].present?
			@movies = Movie.search(params[:search]);
		else
			@movies = Movie.all.order('created_at DESC');
		end
	end

	def show
		@reviews = Review.where(movie_id: @movie)

		if @reviews.any?
			@avg_rating = @reviews.average(:rating)
		else
			@avg_rating = 0
		end
	end

	def update
		@movie = current_user.movies.find(params[:id])
		@movie.update(movie_params)

		if @movie.save
			redirect_to @movie, notice: 'Movie was successfully updated!'
		else
			render 'edit'
		end
	end

	def destroy
		@movie = current_user.movies.find(params[:id])

		@movie.destroy
		
		redirect_to root_path, notice: 'Movie was deleted successfully!'
	end

	private

	def set_movie
		@movie = Movie.find(params[:id])
	end

	def movie_params
		params.require(:movie).permit(:title, :description, :movie_length, :rating, :director, :image)
	end

end
