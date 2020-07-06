module FHIR
  # fhir/enrollment_response_status.rb
  class EnrollmentResponseStatus < Element
    include Mongoid::Document
    field :value, type: String

    def self.transform_json(json_hash, target = EnrollmentResponseStatus.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
