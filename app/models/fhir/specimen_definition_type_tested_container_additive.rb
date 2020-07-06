module FHIR
  # fhir/specimen_definition_type_tested_container_additive.rb
  class SpecimenDefinitionTypeTestedContainerAdditive < BackboneElement
    include Mongoid::Document
    embeds_one :additiveCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :additiveReference, class_name: 'Reference'

    def self.transform_json(json_hash, target = SpecimenDefinitionTypeTestedContainerAdditive.new)
      result = self.superclass.transform_json(json_hash, target)
      result['additiveCodeableConcept'] = CodeableConcept.transform_json(json_hash['additiveCodeableConcept']) unless json_hash['additiveCodeableConcept'].nil?      
      result['additiveReference'] = Reference.transform_json(json_hash['additiveReference']) unless json_hash['additiveReference'].nil?      

      result
    end
  end
end
