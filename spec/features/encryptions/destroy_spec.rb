require 'rails_helper'

RSpec.describe 'Delete Encryptions:', type: :feature do

  before :each do
    @encryption = Encryption.create(ciphertext: "keder ohulw", key: "02715")
  end

  it 'has a button to delete from the show page' do
    visit "/encryptions/#{@encryption.id}"
    expect(page).to have_button("Destroy Record")
  end

  it 'deletes the record' do
    visit "/encryptions/#{@encryption.id}"
    click_button("Destroy Record")
    expect(current_path).to eq("/encryptions/#{@encryption.id}/confirmation")
    expect(page).to have_content("Encryption ##{@encryption.id} has been permanently deleted.")
  end
end
