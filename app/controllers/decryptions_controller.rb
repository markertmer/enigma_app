class DecryptionsController < ApplicationController

  def new
  end

  def create
    decryption = Decryption.new(message: params[:message], key: params[:key], date: params[:date])

    if decryption.save
      output = Enigma.new.decrypt(params[:message], params[:key], params[:date])
      decryption.update(output)
      redirect_to "/decryptions/#{decryption.id}"
    else
      redirect_to "/decryptions/new"
      flash[:alert] = "ERROR: #{error_message(decryption.errors)}"
    end
  end

  def show
    @decryption = Decryption.find(params[:id])
  end

  def destroy
    Decryption.find(params[:id]).destroy
    redirect_to("/decryptions/#{params[:id]}/confirmation")
  end

  def confirmation
    @record_number = params[:id]
  end
end
