class FindAllSerialsWithActorService
  attr_reader :actor_name

  def initialize(actor_name:)
    @actor_name = actor_name
  end

  def perform
    find_serials
  end

  private

  def find_serials
    return Serial.all if actor_name.empty?

    actor = Actor.find_by(name: actor_name)

    ActorsSerial.where(actor: actor).map(&:serial)
  end
end