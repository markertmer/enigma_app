class DecryptionsController < ApplicationController

  def new
  end

  def create
    output = Enigma.new.decrypt(params[:message], params[:key], params[:date])

    decryption = Decryption.create(output)
    # encryption = Encryption.create(ciphertext: output[:ciphertext], key: output[:key])

    redirect_to "/decryptions/#{decryption.id}"
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
