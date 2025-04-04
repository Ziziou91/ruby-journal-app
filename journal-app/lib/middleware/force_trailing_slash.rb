class ForceTrailingSlash
    def initialize(app)
      @app = app
    end

    def call(env)
      request = Rack::Request.new(env)

      # Only redirect GET requests and ignore assets or already-correct paths
      if request.get? && should_redirect?(request)
        location = "#{request.url}/"
        location.gsub!(/(?<!:)\/\/+/, "/") # Remove double slashes except after 'http(s):'
        [ 301, { "Location" => location, "Content-Type" => "text/html" }, [ "Moved Permanently" ] ]
      else
        @app.call(env)
      end
    end

    private

    def should_redirect?(request)
      path = request.path
      # Skip if it already ends in a slash, is root, or is a file (has extension)
      !path.end_with?("/") && path != "/" && !path.match(/\.\w+$/)
    end
end
