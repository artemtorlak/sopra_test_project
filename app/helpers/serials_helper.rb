module SerialsHelper

  def serial_average_rating(serial)
    serial.reviews.average(:stars)
  end
end
