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

  def titleize(title)
    title.split.map(&:capitalize).join(' ')
  end

  def truncate_and_titleize(title, length = 40)
    truncate(titleize(title), length: length)
  end
end
