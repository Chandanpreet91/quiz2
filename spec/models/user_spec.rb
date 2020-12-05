require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#full_name" do 
    it "joins first_name & last_name together with a space" do 
      user = FactoryBot.build(:user, first_name: "Jane", last_name: "Doe")
      expect(user.full_name).to eq("Jane Doe")
    end
    it "trims dandling spaces at the beginning and end" do 
      user = FactoryBot.build(:user,first_name: "Jane", last_name: nil)
      expect(user.full_name).to eq("Jane ")
      user = FactoryBot.build(:user,first_name: nil, last_name: "Doe")
      expect(user.full_name).to eq(" Doe")
    end
  end
  describe "validates" do 
    it "requires unique emails" do 
    persisted_user = FactoryBot.create(:user)
    user = FactoryBot.build(:user, email: persisted_user.email)

    user.valid?

    expect(user.errors.messages).to have_key(:email)
    end
    [
      "what",
      "$()@something.com",
      "bob@ggole.89",
      "test@test#com",
      "name@domain.g-z",
    ].each do |invalid_email|
       it "requires email \"#{invalid_email}\" to be invalid" do 
        user = FactoryBot.build(:user)
        user.email = invalid_email
        user.valid?
        expect(user.errors.messages).to(have_key(:email),"expected\"#{invalid_email}\" to be invalid")
      end
     end
  end
end
