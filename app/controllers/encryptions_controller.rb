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

end
