require 'elasticsearch/model'

class Article < ActiveRecord::Base
    belongs_to :user, touch: true
    has_many :comments, dependent: :destroy


    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    settings index: { number_of_shards: 1 } do
        mapping dynamic: false do
        indexes :title, analyzer: 'english'
        indexes :text, analyzer: 'english'
        end
    end

   def self.search(query)
   __elasticsearch__.search(
   {
     query: {
        multi_match: {
          query: query,
          fields: ['title^5', 'text']
        }
      },
   })
   end

  after_commit on: [:destroy] do
    __elasticsearch__
  end
end
