module FHIR
  # fhir/enrollment_request_status.rb
  class EnrollmentRequestStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'EnrollmentRequestStatus'
    field :value, type: String

    def self.transform_json(json_hash, target=EnrollmentRequestStatus.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
