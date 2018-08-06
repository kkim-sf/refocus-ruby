require "refocus/client"
require "refocus/version"

module Refocus
  def self.client(url: ENV.fetch("REFOCUS_URL"), token: ENV.fetch("REFOCUS_API_TOKEN"))
    @@client ||= Client.new(url: url, token: token)
    @@client
  end
end
