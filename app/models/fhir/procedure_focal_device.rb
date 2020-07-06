module FHIR
  # fhir/procedure_focal_device.rb
  class ProcedureFocalDevice < BackboneElement
    include Mongoid::Document
    embeds_one :action, class_name: 'CodeableConcept'
    embeds_one :manipulated, class_name: 'Reference'

    def self.transform_json(json_hash, target = ProcedureFocalDevice.new)
      result = self.superclass.transform_json(json_hash, target)
      result['action'] = CodeableConcept.transform_json(json_hash['action']) unless json_hash['action'].nil?      
      result['manipulated'] = Reference.transform_json(json_hash['manipulated']) unless json_hash['manipulated'].nil?      

      result
    end
  end
end
