module ApplicationHelper

  # converts markdown text into valid HTML
  def markdown(text)
    #options = [:hard_wrap, :autolink]
    #Redcarpet.new(text, *options).to_html.html_safe
	@markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :hard_wrap => true)
	@markdown.render(text).html_safe
	#Redcarpet.new(text, :hard_wrap => true).to_html.html_safe
  end
end
