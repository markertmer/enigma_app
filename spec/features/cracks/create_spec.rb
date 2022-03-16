require 'rails_helper'

RSpec.describe 'New Encryptions:', type: :feature do

  it 'has a page for new cracks' do
    visit '/cracks/new'
    expect(page).to have_content("Crack An Encoded Message")
  end

  it 'cracks a message' do
    visit '/cracks/new'
    fill_in("Message", with: "z nof,vyrigf!cwif" )
    fill_in("Date", with: "160322")
    click_button("CRACK THE CODE")
    crack = Crack.last
    expect(current_path).to eq("/crack/#{crack.id}")
    expect(page).to have_content(crack.message)
    expect(page).to have_content("Hello, world! end")
    expect(page).to have_content(crack.key)
    expect(page).to have_content(crack.date)
    expect(page).to have_content("160322")
  end
end
