module FHIR
  # fhir/biologically_derived_product_processing.rb
  class BiologicallyDerivedProductProcessing < BackboneElement
    include Mongoid::Document
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :procedure, class_name: 'FHIR::CodeableConcept'    
    embeds_one :additive, class_name: 'FHIR::Reference'    
    embeds_one :timeDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :timePeriod, class_name: 'FHIR::Period'    

    def self.transform_json(json_hash, target = BiologicallyDerivedProductProcessing.new)
      result = self.superclass.transform_json(json_hash, target)
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['procedure'] = CodeableConcept.transform_json(json_hash['procedure']) unless json_hash['procedure'].nil?
      result['additive'] = Reference.transform_json(json_hash['additive']) unless json_hash['additive'].nil?
      result['timeDateTime'] = PrimitiveDateTime.transform_json(json_hash['timeDateTime'], json_hash['_timeDateTime']) unless json_hash['timeDateTime'].nil?
      result['timePeriod'] = Period.transform_json(json_hash['timePeriod']) unless json_hash['timePeriod'].nil?

      result
    end
  end
end
