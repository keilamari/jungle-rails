require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    before(:each) do
      @category = Category.new(id: 2, name: "Furniture")
      @product = Product.new(id: 4, name: "Chair", description: "This is a chair", image: "image", price_cents: 2645765, quantity: 3, category: @category)
    end

    it "should be valid" do
      expect(@product).to be_valid
    end

    it "should have a name" do
      @product.name = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to_not be_empty
    end

    it "should have a price" do 
      @product.price_cents = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to_not be_empty
    end

    it "should have a quantity" do 
      @product.quantity = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to_not be_empty
    end

    it "should have a category" do 
      @product.category_id = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to_not be_empty
    end
  
  end
end