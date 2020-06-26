module FHIR
  # fhir/compartment_code.rb
  class CompartmentCode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CompartmentCode'
    field :value, type: String

    def self.transform_json(json_hash)
      result = CompartmentCode.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
