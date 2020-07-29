module FHIR
  # fhir/substance_specification_code.rb
  class SubstanceSpecificationCode < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :status, class_name: 'FHIR::CodeableConcept'    
    embeds_one :statusDate, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :comment, class_name: 'FHIR::PrimitiveString'    
    embeds_many :source, class_name: 'FHIR::Reference'    

    def self.transform_json(json_hash, target = SubstanceSpecificationCode.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['status'] = CodeableConcept.transform_json(json_hash['status']) unless json_hash['status'].nil?
      result['statusDate'] = PrimitiveDateTime.transform_json(json_hash['statusDate'], json_hash['_statusDate']) unless json_hash['statusDate'].nil?
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?
      result['source'] = json_hash['source'].map { |var| Reference.transform_json(var) } unless json_hash['source'].nil?

      result
    end
  end
end
