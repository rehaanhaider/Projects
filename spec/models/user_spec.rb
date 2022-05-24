require 'rails_helper'

RSpec.describe User, type: :model do

  subject { User.new(name: 'abcd' , email: 'a@b.com', password: '123456')}
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject.valid?).to be(false)
  end

  it 'name, email ,password should be present' do
    expect(subject.valid?).to be(true)
  end

  it 'password should be present' do
    subject.password = nil
    expect(subject.valid?).to be(false)
  end

  it 'password length should be greater than 6' do
    subject.password = '123'
    expect(subject.valid?).to be(false)
  end

  it 'email should be valid' do
    subject.email = '123'
    expect(subject.valid?).to be(false)
  end

  it 'should have ' do
    subject.email = '123'
    expect(subject.valid?).to be(false)
  end
  
  it 'should have  many articles' do
    t = User.reflect_on_association(:articles)
    expect(t.macro).to eq(:has_many)
  end

end
