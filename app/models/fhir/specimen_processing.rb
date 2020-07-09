module FHIR
  # fhir/specimen_processing.rb
  class SpecimenProcessing < BackboneElement
    include Mongoid::Document
    embeds_one :description, class_name: 'FHIR::PrimitiveString'
    embeds_one :procedure, class_name: 'FHIR::CodeableConcept'
    embeds_many :additive, class_name: 'FHIR::Reference'
    embeds_one :timeDateTime, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :timePeriod, class_name: 'FHIR::Period'

    def self.transform_json(json_hash, target = SpecimenProcessing.new)
      result = self.superclass.transform_json(json_hash, target)
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['procedure'] = CodeableConcept.transform_json(json_hash['procedure']) unless json_hash['procedure'].nil?      
      result['additive'] = json_hash['additive'].map { |var| Reference.transform_json(var) } unless json_hash['additive'].nil?
      result['timeDateTime'] = PrimitiveDateTime.transform_json(json_hash['timeDateTime'], json_hash['_timeDateTime']) unless json_hash['timeDateTime'].nil?      
      result['timePeriod'] = Period.transform_json(json_hash['timePeriod']) unless json_hash['timePeriod'].nil?      

      result
    end
  end
end
