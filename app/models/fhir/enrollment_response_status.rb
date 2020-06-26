module FHIR
  # fhir/enrollment_response_status.rb
  class EnrollmentResponseStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'EnrollmentResponseStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = EnrollmentResponseStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
