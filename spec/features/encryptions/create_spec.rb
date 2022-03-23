require 'rails_helper'

RSpec.describe 'New Encryptions:', type: :feature do

  it 'has a page for new encryptions' do
    visit '/encryptions/new'
    expect(page).to have_content("Encrypt Your Message")
  end

  it 'encrypts a message without a key' do
    visit '/encryptions/new'
    fill_in("Message", with: "hello, world" )
    click_button("ENCRYPT")
    encryption = Encryption.last
    expect(current_path).to eq("/encryptions/#{encryption.id}")
    expect(page).to have_content(encryption.ciphertext)
    expect(page).to have_content(encryption.key)
    # expect(page).to have_content(encryption.created_at.strftime("%d%m%y"))
    # expect(page).to have_content(Date::today.strftime("%d%m%y")) # correct for timezone
  end

  it 'encrypts a message with a key' do
    visit '/encryptions/new'
    fill_in("Message", with: "hello, world" )
    fill_in("Key", with: "77564" )
    click_button("ENCRYPT")
    encryption = Encryption.last
    expect(current_path).to eq("/encryptions/#{encryption.id}")
    expect(page).to have_content(encryption.ciphertext)
    expect(page).to have_content(encryption.key)
    expect(page).to have_content("77564")
    # expect(page).to have_content(encryption.created_at.strftime("%d%m%y"))
    # expect(page).to have_content(Date::today.strftime("%d%m%y")) # correct for timezone
  end
end
