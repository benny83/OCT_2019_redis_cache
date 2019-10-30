module SnippetsHelper
  def active_snippet?(snippet)
    link_to(snippet.split[0...15].join(' '), '#', class: 'list-group-item')
  end
end
