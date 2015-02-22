module ApplicationHelper
  def nav_link(text, link)
    recognized = Rails.application.routes.recognize_path(link)
    #rozpoznaję jaki kontroler jest aktualnie używany, jeżeli pasuje do danego linku ustawiana jest odpowiednia klasa css
    if recognized[:controller] == params[:controller]
      link_to( text, link, :class => "btn btn-success")
    else
      link_to( text, link, :class => "btn")
    end
  end
end
