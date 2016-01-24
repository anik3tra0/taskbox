class CategoriesController < ApplicationController

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			respond_to do |format|
				format.html
				format.js
			end
		end
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		@category.update_attributes(category_params)
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
	end

	private

	def category_params
		params[:category].permit(:name)
	end

end
