module FHIR
  # fhir/audit_event_source.rb
  class AuditEventSource < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'AuditEventSource'
    embeds_one :site, class_name: 'PrimitiveString'
    embeds_one :observer, class_name: 'Reference'
    embeds_many :type, class_name: 'Coding'

    def self.transform_json(json_hash)
      result = AuditEventSource.new
      result['site'] = PrimitiveString.transform_json(json_hash['site'], json_hash['_site']) unless json_hash['site'].nil?      
      result['observer'] = Reference.transform_json(json_hash['observer']) unless json_hash['observer'].nil?      
      result['type'] = json_hash['type'].map { |var| Coding.transform_json(var) } unless json_hash['type'].nil?

      result
    end
  end
end
