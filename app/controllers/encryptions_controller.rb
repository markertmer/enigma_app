class EncryptionsController < ApplicationController

  def new
  end

  def create
    @output = Enigma.new.encrypt(params[:message])
    # @output = Encrypt.new(params[:message]).output
    redirect_to '/encryptions/output'
  end

  def output
    @encryption = @output[:encryption]
    @key = @output[:key]
    @date = @output[:date]
  end

end
