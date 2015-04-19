module ApplicationHelper
  def icon(name)
    content_tag(
      :span,
      nil,
      class: "glyphicon glyphicon-#{name}"
    )
  end

  def menu_active_css(resources: )
    :active if resources.include?(params[:controller])
  end
end
