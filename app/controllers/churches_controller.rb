class ChurchesController < ApplicationController

def index
@churches = Church.all.page(params[:page]).per(5)
end

def new
@church = Church.new
end


private

  def place_params
    params.require(:church).permit(:name, :address, :description, :weblink)
  end


end
