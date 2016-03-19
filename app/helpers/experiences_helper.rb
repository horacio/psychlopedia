module ExperiencesHelper
  def markdown(text)
    extensions = {
      hard_wrap: true,
      filter_html: true,
      autolink: true,
      no_intraemphasis: true
    }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions)

    markdown.render(text).html_safe
  end

  def truncate_and_titleize(title, length = 40)
    truncate(title.titleize, length: length)
  end
end
