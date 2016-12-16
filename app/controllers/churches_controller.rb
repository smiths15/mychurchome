require 'pry'
class ChurchesController < ApplicationController

  def index
  @churches = Church.all.page(params[:page]).per(5)
  end

  def new
  @church = Church.new
  end

  def create
  @church = Church.create(church_params)
    if @church.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @church = Church.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @church = Church.find(params[:id])
  end

  def update
    @church = Church.find(params[:id])
    @church.update_attributes(church_params)

    if @church.valid?
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
      @church = Church.find(params[:id])
      @church.destroy
      redirect_to root_path
  end

  def about
  end

  def search
    @churches = Church.search(params[:search]).page(params[:page]).per(5) if params[:search]
    binding.pry
    if @churches.blank?
      flash.now[:notice] = "Please make a valid entry."
    else
      render :index
    end
  end




private

  def church_params
    params.require(:church).permit(:name, :address, :description, :weblink)
  end


end
