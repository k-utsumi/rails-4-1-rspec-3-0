require 'rails_helper'

RSpec.describe Contact, type: :model do

  # 姓と名とメールがあれば有効な状態であること
  it "is valid with a firstname, lastname and email" do
    contact = Contact.new(
      firstname: 'Aaron',
      lastname: 'Sumner',
      email: 'tester@example.com'
    )
    expect(contact).to be_valid
  end

  # 名がなければ無効な状態であること
  it "is invalid without a firstname" do
    contact = Contact.new(firstname: nil)
    contact.valid?
    expect(contact.errors[:firstname]).to include("can't be blank")
  end

  # 姓がなければ無効な状態であること
  it "is invalid without a lastname" do
    contact = Contact.new(lastname: nil)
    contact.valid?
    expect(contact.errors[:lastname]).to include("can't be blank")
  end

  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address" do
    Contact.create(
      firstname: 'Joe', lastname: 'Tester',
      email: 'tester@example.com'
    )
    contact = Contact.new(
      firstname: 'Jane', lastname: 'Tester',
      email: 'tester@example.com'
    )
    contact.valid?
    expect(contact.errors[:email]).to include("has already been taken")
  end

  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address"

  # 連絡先のフルネームを文字列として返すこと
  it "returns a contact's full name as a string" do
    fName = 'John'
    lName = 'Doe'
    contact = Contact.new(firstname: fName, lastname: lName,
      email: 'johndoe@example.com')
    expect(contact.name).to eq fName + ' ' + lName
  end
end
