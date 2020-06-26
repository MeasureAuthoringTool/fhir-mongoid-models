module FHIR
  # fhir/specimen_definition_type_tested.rb
  class SpecimenDefinitionTypeTested < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SpecimenDefinitionTypeTested'
    embeds_one :isDerived, class_name: 'PrimitiveBoolean'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :preference, class_name: 'SpecimenContainedPreference'
    embeds_one :container, class_name: 'SpecimenDefinitionTypeTestedContainer'
    embeds_one :requirement, class_name: 'PrimitiveString'
    embeds_one :retentionTime, class_name: 'Duration'
    embeds_many :rejectionCriterion, class_name: 'CodeableConcept'
    embeds_many :handling, class_name: 'SpecimenDefinitionTypeTestedHandling'

    def self.transform_json(json_hash)
      result = SpecimenDefinitionTypeTested.new
      result['isDerived'] = PrimitiveBoolean.transform_json(json_hash['isDerived'], json_hash['_isDerived']) unless json_hash['isDerived'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['preference'] = SpecimenContainedPreference.transform_json(json_hash['preference']) unless json_hash['preference'].nil?      
      result['container'] = SpecimenDefinitionTypeTestedContainer.transform_json(json_hash['container']) unless json_hash['container'].nil?      
      result['requirement'] = PrimitiveString.transform_json(json_hash['requirement'], json_hash['_requirement']) unless json_hash['requirement'].nil?      
      result['retentionTime'] = Duration.transform_json(json_hash['retentionTime']) unless json_hash['retentionTime'].nil?      
      result['rejectionCriterion'] = json_hash['rejectionCriterion'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['rejectionCriterion'].nil?
      result['handling'] = json_hash['handling'].map { |var| SpecimenDefinitionTypeTestedHandling.transform_json(var) } unless json_hash['handling'].nil?

      result
    end
  end
end
