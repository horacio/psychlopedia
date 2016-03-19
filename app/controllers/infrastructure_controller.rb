class InfrastructureController < ApplicationController
  before_action :set_title

  SECTIONS = %i(about style legal private).freeze

  SECTIONS.each do |section|
    define_method(section) {}
  end

  private

  def set_title
    translated_title = t("psychlopedia.titles.#{action_name}_title")
    @page_title = "Psychlopedia - #{translated_title}"
  end
end
