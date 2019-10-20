class SnippetsController < ApplicationController
  def index
    render :index, locals: { snippets: fetch_snippets }
  end

  private

  def fetch_snippets
    snippets =  $redis.get("snippets")
    if snippets.nil?
      snippets = Snippet.all.to_json
      $redis.set("snippets", snippets)
      $redis.expire("snippets", 1.hour.to_i)
    end
    JSON.load(snippets)
  end
end
