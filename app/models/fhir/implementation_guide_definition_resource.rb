module FHIR
  # fhir/implementation_guide_definition_resource.rb
  class ImplementationGuideDefinitionResource < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImplementationGuideDefinitionResource'
    embeds_one :reference, class_name: 'Reference'
    embeds_many :fhirVersion, class_name: 'FHIRVersion'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :exampleboolean, class_name: 'PrimitiveBoolean'
    embeds_one :examplecanonical, class_name: 'PrimitiveCanonical'
    embeds_one :groupingId, class_name: 'PrimitiveId'

    def self.transform_json(json_hash)
      result = ImplementationGuideDefinitionResource.new
      result['reference'] = Reference.transform_json(json_hash['reference']) unless json_hash['reference'].nil?      
      result['fhirVersion'] = json_hash['fhirVersion'].map { |var| FHIRVersion.transform_json(var) } unless json_hash['fhirVersion'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['exampleboolean'] = PrimitiveBoolean.transform_json(json_hash['exampleboolean'], json_hash['_exampleboolean']) unless json_hash['exampleboolean'].nil?      
      result['examplecanonical'] = PrimitiveCanonical.transform_json(json_hash['examplecanonical'], json_hash['_examplecanonical']) unless json_hash['examplecanonical'].nil?      
      result['groupingId'] = PrimitiveId.transform_json(json_hash['groupingId'], json_hash['_groupingId']) unless json_hash['groupingId'].nil?      

      result
    end
  end
end
