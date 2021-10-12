class ApartmentsController < ApplicationController
  def index
    @apartments = Apartment.all
  end
  def new
    @apartment = Apartment.new
  end
  def create
    @apartment = Apartment.new(apartment_params)
    if @apartment.save
      redirect_to apartments_path
    else
      render :new
    end
  end
  def show
    @apartment = Apartment.find(params[:id])
  end
  def edit
    @apartment = Apartment.find(params[:id])
  end
  def update
    @apartment = Apartment.find(params[:id])
    if @apartment.update(apartment_params)
      redirect_to apartments_path
    else
      render :edit
    end
  end
  
  private
  def apartment_params
    params.require(:apartment).permit(:name, :rent, :address, :age, :remarks)
  end
end
