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

private

  def church_params
    params.require(:church).permit(:name, :address, :description, :weblink)
  end


end
