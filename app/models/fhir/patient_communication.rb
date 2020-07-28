module FHIR
  # fhir/patient_communication.rb
  class PatientCommunication < BackboneElement
    include Mongoid::Document
    embeds_one :language, class_name: 'FHIR::CodeableConcept'    
    embeds_one :preferred, class_name: 'FHIR::PrimitiveBoolean'    

    def self.transform_json(json_hash, target = PatientCommunication.new)
      result = self.superclass.transform_json(json_hash, target)
      result['language'] = CodeableConcept.transform_json(json_hash['language']) unless json_hash['language'].nil?
      result['preferred'] = PrimitiveBoolean.transform_json(json_hash['preferred'], json_hash['_preferred']) unless json_hash['preferred'].nil?

      result
    end
  end
end
