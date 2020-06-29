module FHIR
  # fhir/substance_specification_name_official.rb
  class SubstanceSpecificationNameOfficial < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSpecificationNameOfficial'
    embeds_one :authority, class_name: 'CodeableConcept'
    embeds_one :status, class_name: 'CodeableConcept'
    embeds_one :date, class_name: 'PrimitiveDateTime'

    def self.transform_json(json_hash, target=SubstanceSpecificationNameOfficial.new)
      result = self.superclass.transform_json(json_hash, target)
      result['authority'] = CodeableConcept.transform_json(json_hash['authority']) unless json_hash['authority'].nil?      
      result['status'] = CodeableConcept.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      

      result
    end
  end
end
