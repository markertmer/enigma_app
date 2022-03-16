require 'rails_helper'

RSpec.describe 'New Decryptions:', type: :feature do

  it 'has a page for new decryptions' do
    visit '/decryptions/new'
    expect(page).to have_content("Decrypt Your Message")
  end

  it 'decrypts a message' do
    visit '/decryptions/new'
    fill_in("Message", with: "keder ohulw")
    fill_in("Key", with: "02715")
    fill_in("Date", with: "040895")
    click_button("DECRYPT")
    decryption = Decryption.last
    expect(current_path).to eq("/decryptions/#{decryption.id}")
    expect(page).to have_content(decryption.text)
    expect(page).to have_content("hello world")
    expect(page).to have_content(decryption.key)
    expect(page).to have_content(decryption.date)
  end
end
