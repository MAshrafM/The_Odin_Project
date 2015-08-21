require 'socket'
require 'json'
require 'net/http'
require 'uri'

module WebBrowser
  # Your code goes here...
end

require_relative "./WebBrowser/version"
require_relative "./WebBrowser/request.rb"
require_relative "./WebBrowser/server.rb"
require_relative "./WebBrowser/response.rb"
require_relative "./WebBrowser/response_404.rb"
require_relative "./WebBrowser/response_200.rb"
require_relative "./WebBrowser/website.rb"
require_relative "./WebBrowser/browser.rb"