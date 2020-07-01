module FHIR
  # fhir/medication_administration_performer.rb
  class MedicationAdministrationPerformer < BackboneElement
    include Mongoid::Document
    embeds_one :function, class_name: 'CodeableConcept'
    embeds_one :actor, class_name: 'Reference'

    def self.transform_json(json_hash, target = MedicationAdministrationPerformer.new)
      result = self.superclass.transform_json(json_hash, target)
      result['function'] = CodeableConcept.transform_json(json_hash['function']) unless json_hash['function'].nil?      
      result['actor'] = Reference.transform_json(json_hash['actor']) unless json_hash['actor'].nil?      

      result
    end
  end
end
