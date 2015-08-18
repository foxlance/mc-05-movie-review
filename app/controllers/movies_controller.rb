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
			redirect_to @movie
		else
			render 'new'
		end
	end

	def show
		
	end

	def update
		@movie = current_user.movies.find(params[:id])
		@movie.update(movie_params)

		if @movie.save
			redirect_to @movie
		else
			render 'edit'
		end
	end

	private

	def set_movie
		@movie = Movie.find(params[:id])
	end

	def movie_params
		params.require(:movie).permit(:title, :description, :movie_length, :rating, :director, :image)
	end

end
