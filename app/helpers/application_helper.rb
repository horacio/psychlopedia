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
end
