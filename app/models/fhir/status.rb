module FHIR
  # fhir/status.rb
  class Status < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Status'
    field :value, type: String

    def self.transform_json(json_hash)
      result = Status.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
