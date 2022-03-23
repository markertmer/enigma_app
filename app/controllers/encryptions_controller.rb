class EncryptionsController < ApplicationController

  def new
  end

  def create
    # encryption = Encryption.new(message: params[:message], key: params[:key])
    encryption = Encryption.new(encryption_params)
    if encryption.save
      # output = Enigma.new.encrypt(params[:message], key: params[:key])
      output = Enigma.new.encrypt(encryption_params.values)
      encryption.update(output)
      redirect_to "/encryptions/#{encryption.id}"
    else
      redirect_to "/encryptions/new"
      flash[:alert] = "ERROR: #{error_message(encryption.errors)}"
    end
  end

  def show
    @encryption = Encryption.find(params[:id])
  end

  def destroy
    Encryption.find(params[:id]).destroy
    redirect_to("/encryptions/#{params[:id]}/confirmation")
  end

  def confirmation
    @record_number = params[:id]
  end

  private

  def encryption_params
    params.permit(:message, :key)
  end
end
