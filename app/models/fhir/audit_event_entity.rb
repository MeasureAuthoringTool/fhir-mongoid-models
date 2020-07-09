module FHIR
  # fhir/audit_event_entity.rb
  class AuditEventEntity < BackboneElement
    include Mongoid::Document
    embeds_one :what, class_name: 'FHIR::Reference'
    embeds_one :type, class_name: 'FHIR::Coding'
    embeds_one :role, class_name: 'FHIR::Coding'
    embeds_one :lifecycle, class_name: 'FHIR::Coding'
    embeds_many :securityLabel, class_name: 'FHIR::Coding'
    embeds_one :name, class_name: 'FHIR::PrimitiveString'
    embeds_one :description, class_name: 'FHIR::PrimitiveString'
    embeds_one :query, class_name: 'FHIR::PrimitiveBase64Binary'
    embeds_many :detail, class_name: 'FHIR::AuditEventEntityDetail'

    def self.transform_json(json_hash, target = AuditEventEntity.new)
      result = self.superclass.transform_json(json_hash, target)
      result['what'] = Reference.transform_json(json_hash['what']) unless json_hash['what'].nil?      
      result['type'] = Coding.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['role'] = Coding.transform_json(json_hash['role']) unless json_hash['role'].nil?      
      result['lifecycle'] = Coding.transform_json(json_hash['lifecycle']) unless json_hash['lifecycle'].nil?      
      result['securityLabel'] = json_hash['securityLabel'].map { |var| Coding.transform_json(var) } unless json_hash['securityLabel'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['query'] = PrimitiveBase64Binary.transform_json(json_hash['query'], json_hash['_query']) unless json_hash['query'].nil?      
      result['detail'] = json_hash['detail'].map { |var| AuditEventEntityDetail.transform_json(var) } unless json_hash['detail'].nil?

      result
    end
  end
end
