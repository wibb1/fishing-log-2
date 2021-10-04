class Api::V1::SpeciesController < ApplicationController
  
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update]

  def index
    render json: Species.all

  end

  def create
    # needs to be updated for React
    @species = Species.new(create_params)
    if @species.save
      flash[:notice] = "Species successfully saved"
      puts "*****Species sucessfully saved*****"
      @species = Species.all
      render 'index'
    else
      flash[:errors] = Species_new.errors.full_messages.to_sentence
      puts "----#{@species_new.errors.full_messages.to_sentence}-----"
      render 'new'
    end
  end

  def update
    # needs to be updated for React
    @species = Species.find(params[:id])
    if @species.update(create_params)
      @species = Species.all
      render 'index'
    else
      render 'edit'
    end
  end

  def destroy
    # needs to be updated for React
    Species.destroy(params[:id])
    redirect_to 'new'
  end

  private

  def create_params
    params.require(:species).permit(:common_name,:scientific_name, :shallow_depth, :deep_depth)
  end

end