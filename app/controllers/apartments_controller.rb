class ApartmentsController < ApplicationController
  def index
    @apartments = Apartment.all
  end
  def new
    @apartment = Apartment.new
    2.times { @apartment.accsesses.build }
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
    @accsess = Accsess.where(apartment_id: @apartment.id)
  end
  def edit
    @apartment = Apartment.find(params[:id])
    @apartment.accsesses.build
  end
  def update
    @apartment = Apartment.find(params[:id])
    if @apartment.update(apartment_params)
      redirect_to apartments_path
    else
      render :edit
    end
  end
  def destroy
    @apartment = Apartment.find(params[:id])
    @apartment.destroy
    redirect_to apartments_path
  end
  private
  def apartment_params
    params.require(:apartment).permit(:name, :rent, :address, :age, :remarks, accsesses_attributes: [:line_name, :station_name, :distance, :id, :_destroy])
  end
end
