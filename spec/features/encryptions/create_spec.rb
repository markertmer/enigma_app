require 'rails_helper'
# require 'date'

RSpec.describe 'New Encryptions:', type: :feature do

  it 'has a page for new encryptions' do
    visit '/encryptions/new'
    expect(page).to have_content("Encrypt Your Message")
  end

  it 'encrypts a message' do
    visit '/encryptions/new'
    fill_in("Message", with: "hello, world" )
    click_button("ENCRYPT")
    encryption = Encryption.last
    save_and_open_page
    expect(current_path).to eq("/encryptions/#{encryption.id}")
    expect(page).to have_content(encryption.ciphertext)
    expect(page).to have_content(encryption.key)
    # expect(page).to have_content(encryption.created_at.strftime("%d%m%y"))
    expect(page).to have_content(Date::today.strftime("%d%m%y")) # correct for timezone
  end
end
