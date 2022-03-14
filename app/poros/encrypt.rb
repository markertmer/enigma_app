class Encrypt < Crypt

  def initialize(message, key = nil, date = nil)
    @message = message.downcase
    super(key, date)
  end

  def output
    {
      ciphertext: encrypt_message,
      key: @key,
      # date: @date
    }
  end

  def encrypt_message
    @input_array = @message.split("")
    @output_array = []
    transform_text
    @output_array.join
  end
end
