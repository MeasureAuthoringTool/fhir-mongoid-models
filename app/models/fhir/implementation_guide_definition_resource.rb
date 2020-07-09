module FHIR
  # fhir/implementation_guide_definition_resource.rb
  class ImplementationGuideDefinitionResource < BackboneElement
    include Mongoid::Document
    embeds_one :reference, class_name: 'FHIR::Reference'
    embeds_many :fhirVersion, class_name: 'FHIR::FHIRVersion'
    embeds_one :name, class_name: 'FHIR::PrimitiveString'
    embeds_one :description, class_name: 'FHIR::PrimitiveString'
    embeds_one :exampleBoolean, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :exampleCanonical, class_name: 'FHIR::PrimitiveCanonical'
    embeds_one :groupingId, class_name: 'FHIR::PrimitiveId'

    def self.transform_json(json_hash, target = ImplementationGuideDefinitionResource.new)
      result = self.superclass.transform_json(json_hash, target)
      result['reference'] = Reference.transform_json(json_hash['reference']) unless json_hash['reference'].nil?      
      result['fhirVersion'] = json_hash['fhirVersion'].map { |var| FHIRVersion.transform_json(var) } unless json_hash['fhirVersion'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['exampleBoolean'] = PrimitiveBoolean.transform_json(json_hash['exampleBoolean'], json_hash['_exampleBoolean']) unless json_hash['exampleBoolean'].nil?      
      result['exampleCanonical'] = PrimitiveCanonical.transform_json(json_hash['exampleCanonical'], json_hash['_exampleCanonical']) unless json_hash['exampleCanonical'].nil?      
      result['groupingId'] = PrimitiveId.transform_json(json_hash['groupingId'], json_hash['_groupingId']) unless json_hash['groupingId'].nil?      

      result
    end
  end
end
