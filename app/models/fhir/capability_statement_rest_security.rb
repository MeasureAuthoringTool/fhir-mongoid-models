module FHIR
  # fhir/capability_statement_rest_security.rb
  class CapabilityStatementRestSecurity < BackboneElement
    include Mongoid::Document
    embeds_one :cors, class_name: 'FHIR::PrimitiveBoolean'
    embeds_many :service, class_name: 'FHIR::CodeableConcept'
    embeds_one :description, class_name: 'FHIR::PrimitiveMarkdown'

    def self.transform_json(json_hash, target = CapabilityStatementRestSecurity.new)
      result = self.superclass.transform_json(json_hash, target)
      result['cors'] = PrimitiveBoolean.transform_json(json_hash['cors'], json_hash['_cors']) unless json_hash['cors'].nil?      
      result['service'] = json_hash['service'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['service'].nil?
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      

      result
    end
  end
end
