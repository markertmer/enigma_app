class Enigma

  def initialize
  end

  # def encrypt(message, key = nil, date = nil)
  def encrypt(params)
    # Encrypt.new(message, key, date).output
    Encrypt.new(params[0], params[1]).output
  end

  def decrypt(ciphertext, key = nil, date = nil)
    Decrypt.new(ciphertext, key, date).output
  end

  def cracker(ciphertext, date)# = nil)
    Cracker.new(ciphertext, date).output
  end
end
