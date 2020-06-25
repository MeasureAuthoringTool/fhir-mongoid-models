module FHIR
  # fhir/sequence_type.rb
  class SequenceType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SequenceType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = SequenceType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
