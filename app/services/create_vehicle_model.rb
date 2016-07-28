class CreateVehicleModel
  attr_reader :webmotors_make_id

  def initialize(args = {})
    @webmotors_make_id = args.fetch(:webmotors_make_id, nil)
  end


  def call
    persist!
  end


  private

  def persist!
    ActiveRecord::Base.transaction do
      models.each do |model|
        Model.find_or_create_by(name: model["Nome"], make_id: webmotors_make_id)
      end
    end
  end

  def models
    web_motors_client.make_id = webmotors_make_id
    JSON.parse(web_motors_client.models.body)
  end

  def web_motors_client
    @web_motors_client ||= WebMotorsClient.new
  end

end
