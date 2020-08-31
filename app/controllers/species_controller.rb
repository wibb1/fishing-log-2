class SpeciesController < ApplicationController
  
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update]

  def new
    @species_new = species.new()
  end

  def create
    @species_new = @species.new(create_params)
    if @speices_new.save
      flash[:notice] = "Species successfully saved"
      puts "*****Species sucessfully saved*****"
      render 'new'
    else
      flash[:errors] = @species_new.errors.full_messages.to_sentence
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
    params.require(:species).permit(:name, :water_column, :legal_size, :legal_size_slot, :legal_size_super)
  end

end