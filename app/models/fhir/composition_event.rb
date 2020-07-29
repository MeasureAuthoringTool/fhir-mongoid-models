module FHIR
  # fhir/composition_event.rb
  class CompositionEvent < BackboneElement
    include Mongoid::Document
    embeds_many :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :period, class_name: 'FHIR::Period'    
    embeds_many :detail, class_name: 'FHIR::Reference'    

    def self.transform_json(json_hash, target = CompositionEvent.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = json_hash['code'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['code'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?
      result['detail'] = json_hash['detail'].map { |var| Reference.transform_json(var) } unless json_hash['detail'].nil?

      result
    end
  end
end
