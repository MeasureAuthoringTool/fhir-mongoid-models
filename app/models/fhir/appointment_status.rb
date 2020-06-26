module FHIR
  # fhir/appointment_status.rb
  class AppointmentStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'AppointmentStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = AppointmentStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
