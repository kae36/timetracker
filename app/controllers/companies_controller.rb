class CompaniesController < ApplicationController
	def index
		@companies = Company.all
	end

	def show
		@company = Company.find(params[:id])
		respond_to do |format|
			format.html # shwo.html.erb
			format.xml	{render xml: @company}
			format.json	{render json: @company}
		end
	end

	def new
		@company = Company.new
	end

	def create
		@company = Company.new(params[:company].permit(:name))
		if @company.save
			flash[:notice] = 'Company Created'
			redirect_to @company	
		else
			flash[:notice] = 'Company Validation Failed'
			render 'new'
		end
	end

	def edit
		@company = Company.find(params[:id])
	end

	def update
		@company = Company.find(params[:id])

		if @company.update(params[:company].permit(:name))
			flash[:notice] = 'Company Created'
			redirect_to @company	
		else
			flash[:notice] = 'Company Validation Failed'
			render 'edit'
		end
end

end
