module ApplicationHelper

  # converts markdown text into valid HTML
  def markdown(text)
    Redcarpet.new(text, [:hard_wrap, :autolink]).to_html.html_safe
  end
end
