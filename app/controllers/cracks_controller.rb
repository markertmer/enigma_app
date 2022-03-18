class CracksController < ApplicationController

  def new
  end

  def create
    crack = Crack.new(message: params[:message], date: params[:date])

    if crack.save
      output = Enigma.new.cracker(params[:message], params[:date])
      crack.update(output)
      redirect_to "/cracks/#{crack.id}"
    else
      redirect_to "/cracks/new"
      flash[:alert] = "ERROR: #{error_message(crack.errors)}"
    end
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
