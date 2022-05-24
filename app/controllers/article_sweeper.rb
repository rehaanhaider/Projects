require "rails/observers/action_controller/caching"

class ArticleSweeper < ActionController::Caching::Sweeper
    observe Article
    def after_save(article)
      expire_cache(article)
    end
   
    def after_destroy(article)
      expire_cache(article)
    end

    def after_update(article)
        expire_cache(article)
    end
   
    private
      def expire_cache(article)
        expire_action(:controller => 'articles', :action => 'index')
      end    
end