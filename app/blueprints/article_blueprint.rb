class ArticleBlueprint < Blueprinter::Base
    identifier :id
      
    view :normal do
      fields :text, :title
    end
  
    view :extended do
      include_view :normal
      fields :user_id, :created_at, :updated_at
    end
  end