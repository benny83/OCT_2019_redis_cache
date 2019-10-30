class SnippetsController < ApplicationController
  def index
    render :index, locals: { snippets: fetch_snippets }
  end

  private

  def fetch_snippets
    Snippet.find_each { |s| $redis.mapped_hmset(:pes, s.id => s.content) }
    $redis.hgetall(:pes)
  end
end
