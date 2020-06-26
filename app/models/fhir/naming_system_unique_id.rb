module FHIR
  # fhir/naming_system_unique_id.rb
  class NamingSystemUniqueId < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'NamingSystemUniqueId'
    embeds_one :type, class_name: 'NamingSystemIdentifierType'
    embeds_one :value, class_name: 'PrimitiveString'
    embeds_one :preferred, class_name: 'PrimitiveBoolean'
    embeds_one :comment, class_name: 'PrimitiveString'
    embeds_one :period, class_name: 'Period'

    def self.transform_json(json_hash)
      result = NamingSystemUniqueId.new
      result['type'] = NamingSystemIdentifierType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['value'] = PrimitiveString.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?      
      result['preferred'] = PrimitiveBoolean.transform_json(json_hash['preferred'], json_hash['_preferred']) unless json_hash['preferred'].nil?      
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?      
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      

      result
    end
  end
end
