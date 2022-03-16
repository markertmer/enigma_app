require 'rails_helper'

RSpec.describe 'Delete Decryptions:', type: :feature do

  before :each do
    @crack = Crack.create(text: "hello world end", key: "02715", date: "040895")
  end

  it 'has a button to delete from the show page' do
    visit "/cracks/#{@crack.id}"
    expect(page).to have_button("Destroy Record")
  end

  it 'deletes the record' do
    visit "/cracks/#{@crack.id}"
    click_button("Destroy Record")
    expect(current_path).to eq("/cracks/#{@crack.id}/confirmation")
    expect(page).to have_content("Crack ##{@crack.id} has been permanently deleted.")
  end
end
