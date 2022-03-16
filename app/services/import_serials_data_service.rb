class ImportSerialsDataService
  attr_reader :data_file

  NAME_COLUMN = 0
  GENRE_COLUMN = 1
  NUMBER_OF_SEASONS_COLUMN = 2
  FIRST_RELEASE_DATE_COLUMN = 3
  DIRECTOR_NAME_COLUMN = 4
  ACTOR_NAME_COLUMN = 5
  SHOOT_LOCATION_COLUMN = 6
  CONUNTRY_COLUMN = 7

  def initialize(file: )
    @data_file = file
  end

  def perform
    import_data
  end

  private

  def import_data
    CSV.foreach(data_file, headers: true) do |serial_data_row|
      serial = find_or_create_serial(serial_data_row)
      actor = create_actor(serial_data_row)

      create_actors_serials( actor_id: actor.id, serial_id: serial.id)
    end
  end

  def find_or_create_serial(serial_data_row)
    Serial.find_or_create_by(name: serial_data_row[NAME_COLUMN],
                             genre: serial_data_row[GENRE_COLUMN],
                             number_of_seasons: serial_data_row[NUMBER_OF_SEASONS_COLUMN],
                             date_of_first_release: serial_data_row[FIRST_RELEASE_DATE_COLUMN],
                             director: serial_data_row[DIRECTOR_NAME_COLUMN],
                             country: serial_data_row[CONUNTRY_COLUMN])
  end

  def create_actor(serial_data_row)
    Actor.create(name: serial_data_row[ACTOR_NAME_COLUMN],
                 shoot_location: serial_data_row[SHOOT_LOCATION_COLUMN])
  end

  def create_actors_serials(actor_id: , serial_id: )
    ActorsSerial.create(actor_id: actor_id, serial_id: serial_id)
  end
end