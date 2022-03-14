require 'rails_helper'

RSpec.describe 'Encryptions', type: :feature do

  it 'has a page for new encryptions' do
    visit '/encryptions/new'
    expect(page).to have_content("Encrypt Your Message")
  end

  it 'encrypts a message' do
    visit '/encryptions/new'
    fill_in("Message", with: "hello, world" )
    click_button("ENCRYPT")
    expect(current_path).to eq('encryptions/output')
  end

end
