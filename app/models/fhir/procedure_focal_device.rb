module FHIR
  # fhir/procedure_focal_device.rb
  class ProcedureFocalDevice < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ProcedureFocalDevice'
    embeds_one :action, class_name: 'CodeableConcept'
    embeds_one :manipulated, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = ProcedureFocalDevice.new
      result['action'] = CodeableConcept.transform_json(json_hash['action']) unless json_hash['action'].nil?      
      result['manipulated'] = Reference.transform_json(json_hash['manipulated']) unless json_hash['manipulated'].nil?      

      result
    end
  end
end
