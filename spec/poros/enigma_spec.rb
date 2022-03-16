require './spec/poros/spec_helper.rb'

describe Enigma do
  before(:each) do
    @enigma = Enigma.new
  end

  it '1. exists' do
    expect(@enigma).to be_instance_of Enigma
  end

  it '2. encrypts a message with a key and date' do
    expected = {
      ciphertext: "keder ohulw",
      key: "02715",
      # date: "040895"
    }
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq expected
  end

  it '3. decrypts a message with a key and date' do
    expected = {
      text: "hello world",
      key: "02715",
      date: "040895"
    }
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq expected
  end

  it '4. encrypts and decrypts using todays date' do
    encrypted = @enigma.encrypt("hello world", "02715")
    expect(@enigma.decrypt(encrypted[:ciphertext], "02715")[:text]).to eq "hello world"
  end

  it '5. encrypts and decrypts using a random key' do
    encrypted = @enigma.encrypt("hello world")
    expect(@enigma.decrypt(encrypted[:ciphertext], encrypted[:key])[:text]).to eq "hello world"
  end

  it '6. cracks a message ending in _end using just the date' do
    encrypted = @enigma.encrypt("hello, world! end")
    expected = @enigma.decrypt(encrypted[:ciphertext], encrypted[:key], encrypted[:date])[:text]
    expect(@enigma.cracker(encrypted[:ciphertext], encrypted[:date])[:text]).to eq expected
    expect(@enigma.cracker(encrypted[:ciphertext], encrypted[:date])[:key]).to eq encrypted[:key]
  end
end
