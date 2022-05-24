require 'rails_helper'

RSpec.describe Comment, type: :model do

  subject { Comment.new(commenter: 'abcd' , body: 'a@b.com', article_id: 1)}
  before { subject.save }

  it 'commeneter, body ,article should be present' do
    expect(subject.valid?).to be(true)
  end

  it 'article should belong to user' do
    expect(Comment.reflect_on_association(:article).macro).to eq :belongs_to
    expect(Comment.column_names).to include "article_id"
  end
  

end
