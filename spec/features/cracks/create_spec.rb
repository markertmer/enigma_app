require 'rails_helper'

RSpec.describe 'New Cracks:', type: :feature do

  xit 'has a page for new cracks' do
    visit '/cracks/new'
    expect(page).to have_content("Crack An Encrypted Message")
  end

  xit 'cracks a message' do
    visit '/cracks/new'
    fill_in("Message", with: "z nof,vyrigf!cwif" )
    fill_in("Date", with: "160322")
    click_button("CRACK THE CODE")
    crack = Crack.last
    expect(current_path).to eq("/cracks/#{crack.id}")
    expect(page).to have_content(crack.text)
    expect(page).to have_content("hello, world! end")
    expect(page).to have_content(crack.key)
    expect(page).to have_content(crack.date)
    expect(page).to have_content("160322")
  end
end
