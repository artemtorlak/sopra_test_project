class ImportReviewsDataService
  attr_reader :data_file

  SERIAL_NAME_COLUMN = 0
  USER_NAME_COLUMN = 1
  STARS_COLUMN = 2
  REVIEW_COLUMN = 3

  def initialize(file:)
    @data_file = file
  end

  def perform
    import_data
  end

  private

  def import_data
    CSV.foreach(data_file, headers: true) do |serial_data_row|
      serial = Serial.find_by(name: serial_data_row[SERIAL_NAME_COLUMN])

      create_review(serial.id, serial_data_row)
    end
  end

  def create_review(serial_id, serial_data_row)
    Review.create(serial_id: serial_id,
                  user_name: serial_data_row[USER_NAME_COLUMN], 
                  stars: serial_data_row[STARS_COLUMN], 
                  review_comment: serial_data_row[REVIEW_COLUMN])
  end
end