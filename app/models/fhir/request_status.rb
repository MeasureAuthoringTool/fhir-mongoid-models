module FHIR
  # fhir/request_status.rb
  class RequestStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'RequestStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = RequestStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
