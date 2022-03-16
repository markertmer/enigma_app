class EncryptionsController < ApplicationController

  def new
  end

  def create
    output = Enigma.new.encrypt(params[:message])

    encryption = Encryption.create(output)
    # encryption = Encryption.create(ciphertext: output[:ciphertext], key: output[:key])

    redirect_to "/encryptions/#{encryption.id}"
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
end
