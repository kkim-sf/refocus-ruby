require "refocus/http"
require "refocus/json_helper"

module Refocus
  class Subjects
    include JsonHelper

    attr_reader :http

    def initialize(url:, token:)
      @http = Refocus::Http.new(url: url, token: token)
    end

    def all
      json(http.get(""))
    end

    def create(parent: nil, name:, options: {})
      path = parent ? "#{parent}/child" : ""
      body = options.merge({"name" => name})
      json(http.post(path, body: body))
    end

    def delete(name:)
      json(http.delete(name))
    end

    def get(name:)
      json(http.get(name))
    end
  end
end
