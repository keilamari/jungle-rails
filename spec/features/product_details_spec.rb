require 'rails_helper'

RSpec.feature "Visitor navigates from home page to product page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "Click on product and see product details" do

    visit root_path

    click_link("Details", match: :first)
    save_and_open_screenshot

    expect(page).to have_content 'Description'
  end
end 