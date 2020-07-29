module FHIR
  # fhir/allergy_intolerance_reaction.rb
  class AllergyIntoleranceReaction < BackboneElement
    include Mongoid::Document
    embeds_one :substance, class_name: 'FHIR::CodeableConcept'    
    embeds_many :manifestation, class_name: 'FHIR::CodeableConcept'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :onset, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :severity, class_name: 'FHIR::AllergyIntoleranceSeverity'    
    embeds_one :exposureRoute, class_name: 'FHIR::CodeableConcept'    
    embeds_many :note, class_name: 'FHIR::Annotation'    

    def self.transform_json(json_hash, target = AllergyIntoleranceReaction.new)
      result = self.superclass.transform_json(json_hash, target)
      result['substance'] = CodeableConcept.transform_json(json_hash['substance']) unless json_hash['substance'].nil?
      result['manifestation'] = json_hash['manifestation'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['manifestation'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['onset'] = PrimitiveDateTime.transform_json(json_hash['onset'], json_hash['_onset']) unless json_hash['onset'].nil?
      result['severity'] = AllergyIntoleranceSeverity.transform_json(json_hash['severity']) unless json_hash['severity'].nil?
      result['exposureRoute'] = CodeableConcept.transform_json(json_hash['exposureRoute']) unless json_hash['exposureRoute'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?

      result
    end
  end
end
