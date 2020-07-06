module FHIR
  # fhir/specimen_definition_type_tested_handling.rb
  class SpecimenDefinitionTypeTestedHandling < BackboneElement
    include Mongoid::Document
    embeds_one :temperatureQualifier, class_name: 'CodeableConcept'
    embeds_one :temperatureRange, class_name: 'Range'
    embeds_one :maxDuration, class_name: 'Duration'
    embeds_one :instruction, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target = SpecimenDefinitionTypeTestedHandling.new)
      result = self.superclass.transform_json(json_hash, target)
      result['temperatureQualifier'] = CodeableConcept.transform_json(json_hash['temperatureQualifier']) unless json_hash['temperatureQualifier'].nil?      
      result['temperatureRange'] = Range.transform_json(json_hash['temperatureRange']) unless json_hash['temperatureRange'].nil?      
      result['maxDuration'] = Duration.transform_json(json_hash['maxDuration']) unless json_hash['maxDuration'].nil?      
      result['instruction'] = PrimitiveString.transform_json(json_hash['instruction'], json_hash['_instruction']) unless json_hash['instruction'].nil?      

      result
    end
  end
end
