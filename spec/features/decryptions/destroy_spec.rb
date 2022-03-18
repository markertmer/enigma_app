require 'rails_helper'

RSpec.describe 'Delete Decryptions:', type: :feature do

  before :each do
    @decryption = Decryption.create(text: "hello world", key: "02715", date: "040895", message: "whatever")
  end

  it 'has a button to delete from the show page' do
    visit "/decryptions/#{@decryption.id}"
    expect(page).to have_button("Destroy Record")
  end

  it 'deletes the record' do
    visit "/decryptions/#{@decryption.id}"
    click_button("Destroy Record")
    expect(current_path).to eq("/decryptions/#{@decryption.id}/confirmation")
    expect(page).to have_content("Decryption ##{@decryption.id} has been permanently deleted.")
  end
end
