require File.join('orange-core', 'core')
require File.join('orange-core', 'resource')

module Orange
  class StaticsResource < Resource
    call_me :statics
    
    def stack_init
      @statics_dir = orange.app_dir(orange.options['statics_dir'] || 'pages')
    end
    
    def route?(packet, path)
      path.gsub(/\/$/, '/index') # replace trailing slash with .*/index
      parts = path.split('/')
      parts.shift  # dump empty string
      matches = Dir.glob("#{File.join(@statics_dir, *parts)}.{haml}")
      if(matches)
        packet['route.static_file'] = matches.first
        true
      else
        false
      end
    end
    
    def route(packet)
      packet[:content] = orange[:parser].haml(packet['route.static_file'], packet, :resource => self)
      packet.finish
    end
  end
end