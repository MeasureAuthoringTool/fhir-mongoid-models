module FHIR
  # fhir/strand_type.rb
  class StrandType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'StrandType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = StrandType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
