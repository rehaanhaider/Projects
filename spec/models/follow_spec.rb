require 'rails_helper'

RSpec.describe Follow, type: :model do

  user1 = User.find(1)
  user2 = User.find(2) 
  subject { Follow.new(follower: user1 , followed_user: user2)}
  before { subject.save }

  it 'follower, followed_user should be present' do
    expect(subject.valid?).to be(true)
  end
end
