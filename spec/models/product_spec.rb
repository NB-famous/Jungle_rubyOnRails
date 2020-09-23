require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    # validation tests/examples here
    before do 
      @category = Category.new(name: "Hardware")
      @category.save
      @product = Product.new(name: "hammer", price: 10, quantity: 10, category: @category )
      @product.save 
    end

    it "Passes if all values are entered" do
        expect(@product).to be_valid
    end

    it "fails when name is not added" do
      @product.name = nil
      @product.valid?
      #puts @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Name can't be blank")
      expect(@product).to_not be_valid
    end

    it "fails when price is not added" do
      @product.price_cents = nil
      @product.valid?
      #puts @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Price is not a number")
      expect(@product).to_not be_valid
    end

    it "fails when quantity is not added" do
      @product.quantity = nil
      @product.valid?
      #puts @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
      expect(@product).to_not be_valid
    end

    it "fails when category is not added" do
      @product.category = nil
      @product.valid?
      #puts @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Category can't be blank")
      expect(@product).to_not be_valid
    end

  end
end
