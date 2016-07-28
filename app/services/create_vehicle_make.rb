class CreateVehicleMake

  def call
    persist!
  end


  private

  def persist!
    ActiveRecord::Base.transaction do
      makes.each do |make|
        Make.find_or_create_by(name: make["Nome"], webmotors_id: make["Id"])
      end
    end
  end

  def makes
    JSON.parse(web_motors_client.makes.body)
  end

  def web_motors_client
    @web_motors_client ||= WebMotorsClient.new
  end

end
