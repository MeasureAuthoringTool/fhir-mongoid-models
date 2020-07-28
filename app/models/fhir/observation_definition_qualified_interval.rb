module FHIR
  # fhir/observation_definition_qualified_interval.rb
  class ObservationDefinitionQualifiedInterval < BackboneElement
    include Mongoid::Document
    embeds_one :category, class_name: 'FHIR::ObservationRangeCategory'    
    embeds_one :range, class_name: 'FHIR::Range'    
    embeds_one :context, class_name: 'FHIR::CodeableConcept'    
    embeds_many :appliesTo, class_name: 'FHIR::CodeableConcept'    
    embeds_one :gender, class_name: 'FHIR::AdministrativeGender'    
    embeds_one :age, class_name: 'FHIR::Range'    
    embeds_one :gestationalAge, class_name: 'FHIR::Range'    
    embeds_one :condition, class_name: 'FHIR::PrimitiveString'    

    def self.transform_json(json_hash, target = ObservationDefinitionQualifiedInterval.new)
      result = self.superclass.transform_json(json_hash, target)
      result['category'] = ObservationRangeCategory.transform_json(json_hash['category']) unless json_hash['category'].nil?
      result['range'] = Range.transform_json(json_hash['range']) unless json_hash['range'].nil?
      result['context'] = CodeableConcept.transform_json(json_hash['context']) unless json_hash['context'].nil?
      result['appliesTo'] = json_hash['appliesTo'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['appliesTo'].nil?
      result['gender'] = AdministrativeGender.transform_json(json_hash['gender']) unless json_hash['gender'].nil?
      result['age'] = Range.transform_json(json_hash['age']) unless json_hash['age'].nil?
      result['gestationalAge'] = Range.transform_json(json_hash['gestationalAge']) unless json_hash['gestationalAge'].nil?
      result['condition'] = PrimitiveString.transform_json(json_hash['condition'], json_hash['_condition']) unless json_hash['condition'].nil?

      result
    end
  end
end
