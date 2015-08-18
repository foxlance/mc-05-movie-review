class MoviesController < ApplicationController
	before_action :set_movie, only: [:edit, :update, :show, :destroy]

	def index
		@movies = Movie.all().order('created_at DESC')	
	end

	def new
		@movie = Movie.new
	end

	def create
		
	end

	private

	def set_movie
		@movie = Movie.find(params[:id])
	end

end
