module ApplicationHelper
  include Pagy::Frontend

  def active_page(title, path)
    if current_page?(path)
      content_tag(:li, role: "presentation", class: "active") do
        link_to title, path, class: 'link', title: title
      end
    else
      content_tag(:li, role: "presentation") do
        link_to title, path, class: 'link', title: title
      end
    end
  end
end
