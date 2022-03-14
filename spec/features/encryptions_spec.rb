require 'rails_helper'

RSpec.describe 'Encryptions', type: :feature do

  before :each do
    # @encryption_1 = Encryption.create(ciphertext: "asdfasdf", key: 23434)
  end

  it 'has a page for new encryptions' do
    visit '/encryptions/new'
    expect(page).to have_content("Encrypt Your Message")
  end

  it 'encrypts a message' do
    visit '/encryptions/new'
    fill_in("Message", with: "hello, world" )
    click_button("ENCRYPT")
    encryption = Encryption.last
    expect(current_path).to eq("/encryptions/#{encryption.id}")
    expect(page).to have_content(encryption.ciphertext)
    expect(page).to have_content(encryption.key)
    expect(page).to have_content(encryption.created_at.strftime("%m%d%y"))
  end

end
