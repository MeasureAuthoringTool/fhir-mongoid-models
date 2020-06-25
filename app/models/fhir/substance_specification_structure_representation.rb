module FHIR
  # fhir/substance_specification_structure_representation.rb
  class SubstanceSpecificationStructureRepresentation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSpecificationStructureRepresentation'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :representation, class_name: 'PrimitiveString'
    embeds_one :attachment, class_name: 'Attachment'

    def self.transform_json(json_hash)
      result = SubstanceSpecificationStructureRepresentation.new
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['representation'] = PrimitiveString.transform_json(json_hash['representation'], json_hash['_representation']) unless json_hash['representation'].nil?      
      result['attachment'] = Attachment.transform_json(json_hash['attachment']) unless json_hash['attachment'].nil?      

      result
    end
  end
end
