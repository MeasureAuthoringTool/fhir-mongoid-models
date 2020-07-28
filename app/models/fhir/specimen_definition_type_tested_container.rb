module FHIR
  # fhir/specimen_definition_type_tested_container.rb
  class SpecimenDefinitionTypeTestedContainer < BackboneElement
    include Mongoid::Document
    embeds_one :material, class_name: 'FHIR::CodeableConcept'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :cap, class_name: 'FHIR::CodeableConcept'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :capacity, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :minimumVolumeSimpleQuantity, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :minimumVolumeString, class_name: 'FHIR::PrimitiveString'    
    embeds_many :additive, class_name: 'FHIR::SpecimenDefinitionTypeTestedContainerAdditive'    
    embeds_one :preparation, class_name: 'FHIR::PrimitiveString'    

    def self.transform_json(json_hash, target = SpecimenDefinitionTypeTestedContainer.new)
      result = self.superclass.transform_json(json_hash, target)
      result['material'] = CodeableConcept.transform_json(json_hash['material']) unless json_hash['material'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['cap'] = CodeableConcept.transform_json(json_hash['cap']) unless json_hash['cap'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['capacity'] = SimpleQuantity.transform_json(json_hash['capacity']) unless json_hash['capacity'].nil?
      result['minimumVolumeSimpleQuantity'] = SimpleQuantity.transform_json(json_hash['minimumVolumeSimpleQuantity']) unless json_hash['minimumVolumeSimpleQuantity'].nil?
      result['minimumVolumeString'] = PrimitiveString.transform_json(json_hash['minimumVolumeString'], json_hash['_minimumVolumeString']) unless json_hash['minimumVolumeString'].nil?
      result['additive'] = json_hash['additive'].map { |var| SpecimenDefinitionTypeTestedContainerAdditive.transform_json(var) } unless json_hash['additive'].nil?
      result['preparation'] = PrimitiveString.transform_json(json_hash['preparation'], json_hash['_preparation']) unless json_hash['preparation'].nil?

      result
    end
  end
end
