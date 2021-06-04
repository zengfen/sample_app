require 'spec_helper'

describe User do
  # it "is valid with a name, password and email"
  # it "is invalid without a name"
  # it "is invalid without a email"
  # it "is invalid with a duplicate email address"
  # it "returns a user's name as a string"

  # it "is invalid without a name" do
  #   user = User.new(name: "123")
  #   expect(user).to be_valid
  # end

  # it"is invalid without email"do
  #   # expect(User.new(name: nil)).to have(1).errors_on(:name)
  # end
  #
  # # 检测 Email 地址唯一性
  # it"is invalid with a duplicate email address" do
  #   User.create(
  #   name: 'Joe', email: 'tester@example.com')
  #   contact = User.new(
  #   name: 'Jane', email: 'tester@example.com')
  #   # expect(contact).to have(1).errors_on(:email)
  # end


  it "returns a sorted array of results that match" do
    john = User.create(name: 'John', email: 'jsmith@example.com')
    tim = User.create(name: 'Tim',email: 'tjones@example.com')
    joy = User.create(name: 'Joy',email: 'jjohnson@example.com')
    # expect(User.by_letter("J")).to eq [john, joy]
    expect(User.by_letter("J")).to_not include tim
  end

end



# spec/factories/phones.rb
require'faker'
FactoryGirl.define do
  factory :phone do
    association :contact  # 在预构件中处理关联和继承
    phone { Faker::PhoneNumber.phone_number }
    # child factories omitted ...
  end
end

require'faker'
FactoryGirl.define do
  factory :contact do
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email }
    after(:build) do |contact|
      [:home_phone, :work_phone, :mobile_phone].each do |phone|
        contact.phones << FactoryGirl.build(:phone,phone_type: phone, contact: contact)
      end
    end
  end

  it "has three phone numbers" do
    expect(create(:contact).phones.count).to eq 3
  end

  # before(:all) { Shop.prepare_database }
  # after (:all) { Shop.cleanup_database }

end

