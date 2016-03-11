module ApplicationHelper
  def flash_notice(except: [])
    flash.select { |name, _msg| except.exclude?(name.to_sym) }.map do |name, msg|
      content_tag :div, msg, class: ['alert', flash_class(name)]
    end.join.html_safe
  end

  def flash_class(name)
    case name
      when 'alert'
        'alert-danger'
      when 'notice'
        'alert-success'
    end
  end
end
