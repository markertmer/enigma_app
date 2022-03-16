require './spec/poros/spec_helper.rb'

describe Encrypt do
  before(:each) do
    @encrypt = Encrypt.new("hello world", "02715", "040895")
  end

  it '1. exists' do
    expect(@encrypt).to be_instance_of Encrypt
  end

  it '2. has a collection of characters' do
    expect(@encrypt.characters).to eq ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"," "]
  end

  it '3. has a message, key, and date' do
    expect(@encrypt.message).to eq "hello world"
    expect(@encrypt.key).to eq "02715"
    expect(@encrypt.date).to eq "040895"
  end

  it '4. uses todays date by default' do
    encrypt = Encrypt.new("hello world", "02715")

    date_string = Date::today.strftime.delete("-")
    expected = date_string[-2..-1] + date_string[-4..-3] + date_string[-6..-5]

    expect(encrypt.date).to eq expected
    # expect(encrypt.date).to eq "130122"
  end

  it '5. generates a random key by default' do
    encrypt = Encrypt.new("hello world")
    expect(encrypt.key.class).to be String
    expect(encrypt.key.length).to be 5
  end

  it '6. creates A, B, C and D shift keys' do
    expected = {A: 2, B: 27, C: 71, D: 15}
    expect(@encrypt.shift_keys).to eq expected
  end

  it '6. creates A, B, C and D offsets' do
    expected = {A: 1, B: 0, C: 2, D: 5}
    expect(@encrypt.offsets).to eq expected
  end

  it '7. creates A, B, C and D shifts' do
    expected = {A: 3, B: 27, C: 73, D: 20}
    expect(@encrypt.shifts).to eq expected
  end

  it '8. encrypts the message' do
    expect(@encrypt.encrypt_message).to eq "keder ohulw"
  end

  it '9. ignores capitalization & special characters' do
    encrypt = Encrypt.new("Hello, world!", "02715", "040895")
    expect(encrypt.encrypt_message).to eq "keder, ohulw!"
    encrypt = Encrypt.new("H$e$l$l$o, w$o$r$l$d!", "02715", "040895")
    expect(encrypt.encrypt_message).to eq "k$e$d$e$r, o$h$u$l$w!"
  end

  it '10. outputs a hash' do
    expected = {
      ciphertext: "keder ohulw",
      key: "02715",
      # date: "040895"
    }
    expect(@encrypt.output).to eq expected
  end
end
