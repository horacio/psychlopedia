module ApplicationHelper
  def page_title
    title = if params[:query]
      t("experiences.#{action_name}_title", query: @query)
    elsif action_name == 'show'
      t("experiences.#{action_name}_title", experience_title: @experience.title.titleize)
    else
      t("experiences.#{action_name}_title")
    end

    title.presence && "Psiclopedia - #{title}" || "Psiclopedia"
  end

  def relocalize_url(locale)
    naked_url, params = request.original_url.split('?')

    if params.present?
      relocalized_params = params.split('&').delete_if { |param| param =~ /locale/ }
      relocalized_params << "locale=#{locale}"
      "#{naked_url}?#{relocalized_params.to_query}"
    else
      "#{naked_url}?locale=#{locale}"
    end
  end
end
