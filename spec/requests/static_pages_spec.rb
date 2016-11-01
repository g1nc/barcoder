require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "Welcome page" do
    it "should have the content 'Simple Loyalty'" do
      visit root_path
      expect(page).to have_content('Simple Loyalty')
    end
  end

  describe "About page" do
    it "should have the content 'About'" do
      visit static_about_path
      expect(page).to have_content('About')
    end
  end

  describe "Contact page" do
    it "should have the content 'Contact'" do
      visit static_contact_path
      expect(page).to have_content('Contact')
    end
  end
end
