class ContactDecorator < Draper::Decorator
  delegate_all

  def name
    "#{object.first_name} #{object.last_name}"
  end

  def full_name
    "#{object.salutation} #{object.first_name} #{object.last_name}"
  end

  def list_group_info
    html = <<-HTML
        <span class='text-left'>#{full_name}</span>
        <span class='pull-right'>#{main_phone if main_phone}</span>
    HTML
    html.html_safe
  end
end
