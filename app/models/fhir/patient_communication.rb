module FHIR
  # fhir/patient_communication.rb
  class PatientCommunication < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'PatientCommunication'
    embeds_one :language, class_name: 'CodeableConcept'
    embeds_one :preferred, class_name: 'PrimitiveBoolean'

    def self.transform_json(json_hash)
      result = PatientCommunication.new
      result['language'] = CodeableConcept.transform_json(json_hash['language']) unless json_hash['language'].nil?      
      result['preferred'] = PrimitiveBoolean.transform_json(json_hash['preferred'], json_hash['_preferred']) unless json_hash['preferred'].nil?      

      result
    end
  end
end
