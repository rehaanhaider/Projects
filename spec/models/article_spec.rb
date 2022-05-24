require 'rails_helper'

RSpec.describe Article, type: :model do

  subject { Article.new(title: 'abcd' , text: 'a@b.com', user_id: 1)}
  before { subject.save }

  it 'title, text ,userid should be present' do
    expect(subject.valid?).to be(true)
  end

  it 'article should belong to user' do
    expect(Article.reflect_on_association(:user).macro).to eq :belongs_to
    expect(Article.column_names).to include "user_id"
  end
  
  it 'should have  many comments' do
    t = Article.reflect_on_association(:comments)
    expect(t.macro).to eq(:has_many)
  end
end
