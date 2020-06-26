module FHIR
  # fhir/audit_event_entity_detail.rb
  class AuditEventEntityDetail < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'AuditEventEntityDetail'
    embeds_one :type, class_name: 'PrimitiveString'
    embeds_one :valuestring, class_name: 'PrimitiveString'
    embeds_one :valuebase64Binary, class_name: 'PrimitiveBase64Binary'

    def self.transform_json(json_hash)
      result = AuditEventEntityDetail.new
      result['type'] = PrimitiveString.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?      
      result['valuestring'] = PrimitiveString.transform_json(json_hash['valuestring'], json_hash['_valuestring']) unless json_hash['valuestring'].nil?      
      result['valuebase64Binary'] = PrimitiveBase64Binary.transform_json(json_hash['valuebase64Binary'], json_hash['_valuebase64Binary']) unless json_hash['valuebase64Binary'].nil?      

      result
    end
  end
end
