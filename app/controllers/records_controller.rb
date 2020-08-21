class RecordsController < ApplicationController

  def new
    @record = Record.new()
    @record.user = current_user
    
  end

  def create
    
  end

end