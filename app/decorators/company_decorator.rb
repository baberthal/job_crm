class CompanyDecorator < Draper::Decorator
  delegate_all

  def full_address
    return object.street_address if object.street_address_2.nil?
    "#{object.street_address}, #{object.street_address_2}"
  end

  def city_state_zip
    return unless object.city && object.state && object.postal_code
    "#{object.city}, #{object.state}, #{object.postal_code}"
  end

  def phone
    object.main_phone || object.second_phone || nil
  end
end
