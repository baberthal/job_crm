class JobDecorator < Draper::Decorator
  delegate_all

  def last_touch(options = {})
    object.last_touch.strftime(time_format(options[:format]))
  end

  def application_sent(options = {})
    object.application_sent.strftime(time_format(options[:format]))
  end

  def time_format(format = nil)
    return '%_m/%-d/%y | %l:%M %P' if format.nil?
    format
  end
end
