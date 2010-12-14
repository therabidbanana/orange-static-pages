require File.join('orange-core', 'middleware', 'base')

module Orange::Middleware
  # The StaticsRouter middleware tries to route to a page
  # contained in the static pages directory.
  # 
  class StaticsRouter < Base    
    # Sets the sitemap resource as the router if the resource can accept 
    # the path.
    def packet_call(packet)
      return (pass packet) if packet['route.router']  # Don't route if other middleware
                                                      # already has
      path = packet['route.path'] || packet.request.path_info
      packet['route.router'] = orange[:statics] if orange[:statics].route?(packet, path)
      pass packet
    end
    
  end
end