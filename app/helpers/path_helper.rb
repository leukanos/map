module PathHelper
  def nav_link(text, link)
    recognized = Rails.application.routes.recognize_path(link)

    if recognized[:controller] == params[:controller]
      link_to( text, link, :class => "btn btn-success")
    else
      link_to( text, link, :class => "btn")
    end
  end

  def link_to_edit(path, args={})
    link_to content_tag(:span, "", class: 'glyphicon glyphicon-edit'), path,
            remote: args[:remote]
  end

  def link_to_destroy(path)
    link_to content_tag(:span, "", class: 'glyphicon glyphicon-remove'), path,
            method: :delete, data: { confirm: t('confirm') }, class: "destroy"
  end
end
