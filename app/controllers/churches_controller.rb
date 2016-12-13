class ChurchesController < ApplicationController

def index
@churches = Church.all.page(params[:page]).per(5)
end

def new
@church = Church.new
end

def create
Church.create(church_params)
redirect_to root_path
end

def show
  @church = Church.find(params[:id])
end

def edit
  @church = Church.find(params[:id])
end

def update
  @church = Church.find(params[:id])
  @church = update_attributes(church_params)
  redirect_to root_path
end

private

  def church_params
    params.require(:church).permit(:name, :address, :description, :weblink)
  end


end
