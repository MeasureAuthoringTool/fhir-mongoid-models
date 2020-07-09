module FHIR
  # fhir/population.rb
  class Population < BackboneElement
    include Mongoid::Document
    embeds_one :ageRange, class_name: 'FHIR::Range'
    embeds_one :ageCodeableConcept, class_name: 'FHIR::CodeableConcept'
    embeds_one :gender, class_name: 'FHIR::CodeableConcept'
    embeds_one :race, class_name: 'FHIR::CodeableConcept'
    embeds_one :physiologicalCondition, class_name: 'FHIR::CodeableConcept'

    def self.transform_json(json_hash, target = Population.new)
      result = self.superclass.transform_json(json_hash, target)
      result['ageRange'] = Range.transform_json(json_hash['ageRange']) unless json_hash['ageRange'].nil?      
      result['ageCodeableConcept'] = CodeableConcept.transform_json(json_hash['ageCodeableConcept']) unless json_hash['ageCodeableConcept'].nil?      
      result['gender'] = CodeableConcept.transform_json(json_hash['gender']) unless json_hash['gender'].nil?      
      result['race'] = CodeableConcept.transform_json(json_hash['race']) unless json_hash['race'].nil?      
      result['physiologicalCondition'] = CodeableConcept.transform_json(json_hash['physiologicalCondition']) unless json_hash['physiologicalCondition'].nil?      

      result
    end
  end
end
