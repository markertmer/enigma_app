class CracksController < ApplicationController

  def new
  end

  def create
    output = Enigma.new.cracker(params[:message], params[:date])
    crack = Crack.create(output)

    redirect_to "/cracks/#{crack.id}"
  end

  def show
    @crack = Crack.find(params[:id])
  end

  def destroy
    Crack.find(params[:id]).destroy
    redirect_to("/cracks/#{params[:id]}/confirmation")
  end

  def confirmation
    @record_number = params[:id]
  end
end
