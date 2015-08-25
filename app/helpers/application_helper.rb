module ApplicationHelper
  BOOTSTRAP_CLASSES = {
    success: 'alert-success',
    error: 'alert-danger',
    alert: 'alert-warning',
    notice: 'alert-info',
    danger: 'alert-danger'
  }

  def bootstrap_class_for(flash_type)
    BOOTSTRAP_CLASSES.fetch(flash_type.to_sym) || flash_type.to_s
  end
end
