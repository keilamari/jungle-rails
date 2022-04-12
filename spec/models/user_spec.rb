require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    before (:each) do
      @user = User.new(name:"Frodo Baggins", email:"frodo@theshire.com", password:"oh-sam!", password_confirmation:"oh-sam!")
    end

    it "should have a name" do
      @user.name = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to_not be_empty
    end

    it "should have an email" do
      @user.email = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to_not be_empty
    end

    it "should have a password" do
      @user.password = nil
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end

    it "password confirmation" do
      @user.password = "gandaaaaaaaalf"
      @user.password_confirmation = "gandaaaaaaaalf!"
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to_not be_empty
    end

    it "password length should be a minimum of 6 characters" do
      @user.password = "pip"
      @user.password_confirmation = "pip"
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to_not be_empty
    end
  end
  describe '.authenticate_with_credentials' do
    before (:each) do
      @user = User.new(name:"Frodo Baggins", email:"frodo@theshire.com", password:"oh-sam!", password_confirmation:"oh-sam!")
    end
    it "should be authenticated with valid credentials" do 
      @user.save
      expect(User.authenticate_with_credentials("frodo@theshire.com", "oh-sam!")).to_not be_nil
    end
    
  end
end