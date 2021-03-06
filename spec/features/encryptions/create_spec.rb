require 'rails_helper'

RSpec.describe 'New Encryptions:', type: :feature do
  describe 'happy paths' do
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
      expect(page).to have_content(Date::today.strftime("%d%m%y")) # correct for timezone
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
      expect(page).to have_content(Date::today.strftime("%d%m%y")) # correct for timezone
    end

    it 'accepts a message up to 500 characters long' do
      visit '/encryptions/new'
      fill_in("Message", with: "I have devised a brutal bike ride to raise money for (@) Ride for Racial Justice, helping them to get 25 BIPOC athletes to the start line of Steamboat Gravel. It’s a very popular and desirable race to participate in, and - like much of cycling - is overdue for an infusion of inclusion. I encourage you to donate whatever you can contribute to this awesome goal, and in return you will get to witness me suffering as I do laps across the notorious Horsetooth Reservoir dams here in Fort Collins" )
      click_button("ENCRYPT")
      encryption = Encryption.last
      expect(current_path).to eq("/encryptions/#{encryption.id}")
      expect(page).to have_content(encryption.ciphertext)
      expect(page).to have_content(encryption.key)
    end
  end

  describe 'sad paths & edge cases' do

    it 'accepts leading zeros for the key' do
      visit '/encryptions/new'
      fill_in("Message", with: "hello, world" )
      fill_in("Key", with: "00564" )
      click_button("ENCRYPT")
      encryption = Encryption.last
      expect(current_path).to eq("/encryptions/#{encryption.id}")
    end

    it 'accepts all zeros for the key' do
      visit '/encryptions/new'
      fill_in("Message", with: "hello, world" )
      fill_in("Key", with: "00000" )
      click_button("ENCRYPT")
      encryption = Encryption.last
      expect(current_path).to eq("/encryptions/#{encryption.id}")
    end

    it 'does not accept spaces' do
      visit '/encryptions/new'
      fill_in("Message", with: "hello, world" )
      fill_in("Key", with: " 6588" )
      click_button("ENCRYPT")
      encryption = Encryption.last
      expect(current_path).to eq("/encryptions/new")
      expect(page).to have_content("Key should not have spaces")
    end
  end
end
