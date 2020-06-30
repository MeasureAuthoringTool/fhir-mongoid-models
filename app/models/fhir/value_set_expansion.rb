module FHIR
  # fhir/value_set_expansion.rb
  class ValueSetExpansion < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ValueSetExpansion'
    embeds_one :identifier, class_name: 'PrimitiveUri'
    embeds_one :timestamp, class_name: 'PrimitiveDateTime'
    embeds_one :total, class_name: 'PrimitiveInteger'
    embeds_one :offset, class_name: 'PrimitiveInteger'
    embeds_many :parameter, class_name: 'ValueSetExpansionParameter'
    embeds_many :contains, class_name: 'ValueSetExpansionContains'

    def self.transform_json(json_hash, target=ValueSetExpansion.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = PrimitiveUri.transform_json(json_hash['identifier'], json_hash['_identifier']) unless json_hash['identifier'].nil?      
      result['timestamp'] = PrimitiveDateTime.transform_json(json_hash['timestamp'], json_hash['_timestamp']) unless json_hash['timestamp'].nil?      
      result['total'] = PrimitiveInteger.transform_json(json_hash['total'], json_hash['_total']) unless json_hash['total'].nil?      
      result['offset'] = PrimitiveInteger.transform_json(json_hash['offset'], json_hash['_offset']) unless json_hash['offset'].nil?      
      result['parameter'] = json_hash['parameter'].map { |var| ValueSetExpansionParameter.transform_json(var) } unless json_hash['parameter'].nil?
      result['contains'] = json_hash['contains'].map { |var| ValueSetExpansionContains.transform_json(var) } unless json_hash['contains'].nil?

      result
    end
  end
end
