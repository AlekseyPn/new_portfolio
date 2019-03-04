module ApplicationHelper
  def login_helper style = ''
    if current_user.is_a?(GuestUser)
      (link_to 'Register', new_user_registration_path, class: style) +
      " ".html_safe +
      (link_to 'Login', new_user_session_path, class: style)
    else
      link_to 'Logout', destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thank for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
      content_tag(:p, greeting, class: 'source-greeting')
    end
  end

  def copyright_generator
    DevcampViewTool::Renderer.copyright 'Aleksey Peresmekhin', 'All right reserved'
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home',
      },
      {
        url: about_me_path,
        title: 'About me',
      },
      {
        url: contact_path,
        title: 'Contact',
      },
      {
        url: blogs_path,
        title: 'Blog',
      },
      {
        url: portfolios_path,
        title: 'Portfolio',
      },
      {
        url: tech_news_path,
        title: "Tech News"
      }
    ]
  end

  def nav_helper  style, tag_type
    safe_join nav_items
      .map { |item| "<#{tag_type}><a href=\"#{item[:url]}\" class=\"#{style} #{active? item[:url]}\">#{item[:title]}</a></#{tag_type}>".html_safe}
  end

  def active? path
    "active" if current_page? path
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    if (alert)      
      alert_generator alert
    end
  end
  
  def alert_generator message
    js add_gritter(message, title: "Aleksey Peresmekhin Portfolio", sticky: false)
  end
end
