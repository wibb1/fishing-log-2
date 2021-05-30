class SpeciesController < ApplicationController
  
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :index]

  def index
    @species = Species.all
  end

  def new
    @species = Species.new()
  end

  def create
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

  def edit
    @species = Species.find(params[:id])
  end

  def update
    @species - Species.find(params[:id])
    if @species.update(create_params)
      render 'new'
    else
      render 'edit'
    end
  end

  def destroy
    Species.destroy(params[:id])
    redirect_to 'new'
  end

  private

  def create_params
    params.require(:species).permit(:common_name,:scientific_name, :shallow_depth, :deep_depth)
  end

end