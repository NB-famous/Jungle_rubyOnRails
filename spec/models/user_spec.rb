require 'rails_helper'

RSpec.describe User, type: :model do


  
  describe 'Validations' do
    # validation tests/examples here

    before :each do 
      @user = User.new(name:"James Bond", email: "nikko@nikko.ca", password: "password", password_confirmation: "password")
      @user.save!
    end
  
    it "Requires a name " do
      @user.name = nil
      @user.valid?
      #puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include ("Name can't be blank")
      expect(@user).to_not be_valid
    end

    it "Requires an email" do
      @user.email = nil
      @user.valid?
      #puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include ("Email can't be blank")
      expect(@user).to_not be_valid
    end

    it "Requires a password" do
      @user.password = nil
      @user.password_confirmation =nil
      @user.valid?
      #puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include("Password can't be blank")
      expect(@user).to_not be_valid
    end

    it "Confirm the password" do
      @user.password = "password"
      @user.password_confirmation = "PassWord"
      @user.valid?
      #puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    before :each do 
      @user = User.new(name:"JamesBond", email:"nikko@nikko.ca", password:"password", password_confirmation: "password")
    end
  
    it "shoud return the correct user" do
      @user.save
      user = User.authenticate_with_credentials("nikko@nikko.ca", "password")
      expect(@user).to be == user
    end 

  end
end


