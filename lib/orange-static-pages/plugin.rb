require File.join('orange-static-pages', 'base')
module Orange::Plugins
  class StaticPages < Base
    views_dir       File.join(File.dirname(__FILE__), 'views')
    
    resource    Orange::StaticsResource.new
    router      Orange::Middleware::StaticsRouter
    
  end
end

Orange.plugin(Orange::Plugins::StaticPages.new)

