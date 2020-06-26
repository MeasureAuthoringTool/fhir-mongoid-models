module FHIR
  # fhir/specimen_definition_type_tested_container.rb
  class SpecimenDefinitionTypeTestedContainer < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SpecimenDefinitionTypeTestedContainer'
    embeds_one :material, class_name: 'CodeableConcept'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :cap, class_name: 'CodeableConcept'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :capacity, class_name: 'SimpleQuantity'
    embeds_one :minimumVolumeSimpleQuantity, class_name: 'SimpleQuantity'
    embeds_one :minimumVolumestring, class_name: 'PrimitiveString'
    embeds_many :additive, class_name: 'SpecimenDefinitionTypeTestedContainerAdditive'
    embeds_one :preparation, class_name: 'PrimitiveString'

    def self.transform_json(json_hash)
      result = SpecimenDefinitionTypeTestedContainer.new
      result['material'] = CodeableConcept.transform_json(json_hash['material']) unless json_hash['material'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['cap'] = CodeableConcept.transform_json(json_hash['cap']) unless json_hash['cap'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['capacity'] = SimpleQuantity.transform_json(json_hash['capacity']) unless json_hash['capacity'].nil?      
      result['minimumVolumeSimpleQuantity'] = SimpleQuantity.transform_json(json_hash['minimumVolumeSimpleQuantity']) unless json_hash['minimumVolumeSimpleQuantity'].nil?      
      result['minimumVolumestring'] = PrimitiveString.transform_json(json_hash['minimumVolumestring'], json_hash['_minimumVolumestring']) unless json_hash['minimumVolumestring'].nil?      
      result['additive'] = json_hash['additive'].map { |var| SpecimenDefinitionTypeTestedContainerAdditive.transform_json(var) } unless json_hash['additive'].nil?
      result['preparation'] = PrimitiveString.transform_json(json_hash['preparation'], json_hash['_preparation']) unless json_hash['preparation'].nil?      

      result
    end
  end
end
