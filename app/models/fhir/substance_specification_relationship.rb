module FHIR
  # fhir/substance_specification_relationship.rb
  class SubstanceSpecificationRelationship < BackboneElement
    include Mongoid::Document
    embeds_one :substanceReference, class_name: 'FHIR::Reference'    
    embeds_one :substanceCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :relationship, class_name: 'FHIR::CodeableConcept'    
    embeds_one :isDefining, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :amountQuantity, class_name: 'FHIR::Quantity'    
    embeds_one :amountRange, class_name: 'FHIR::Range'    
    embeds_one :amountRatio, class_name: 'FHIR::Ratio'    
    embeds_one :amountString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :amountRatioLowLimit, class_name: 'FHIR::Ratio'    
    embeds_one :amountType, class_name: 'FHIR::CodeableConcept'    
    embeds_many :source, class_name: 'FHIR::Reference'    

    def self.transform_json(json_hash, target = SubstanceSpecificationRelationship.new)
      result = self.superclass.transform_json(json_hash, target)
      result['substanceReference'] = Reference.transform_json(json_hash['substanceReference']) unless json_hash['substanceReference'].nil?
      result['substanceCodeableConcept'] = CodeableConcept.transform_json(json_hash['substanceCodeableConcept']) unless json_hash['substanceCodeableConcept'].nil?
      result['relationship'] = CodeableConcept.transform_json(json_hash['relationship']) unless json_hash['relationship'].nil?
      result['isDefining'] = PrimitiveBoolean.transform_json(json_hash['isDefining'], json_hash['_isDefining']) unless json_hash['isDefining'].nil?
      result['amountQuantity'] = Quantity.transform_json(json_hash['amountQuantity']) unless json_hash['amountQuantity'].nil?
      result['amountRange'] = Range.transform_json(json_hash['amountRange']) unless json_hash['amountRange'].nil?
      result['amountRatio'] = Ratio.transform_json(json_hash['amountRatio']) unless json_hash['amountRatio'].nil?
      result['amountString'] = PrimitiveString.transform_json(json_hash['amountString'], json_hash['_amountString']) unless json_hash['amountString'].nil?
      result['amountRatioLowLimit'] = Ratio.transform_json(json_hash['amountRatioLowLimit']) unless json_hash['amountRatioLowLimit'].nil?
      result['amountType'] = CodeableConcept.transform_json(json_hash['amountType']) unless json_hash['amountType'].nil?
      result['source'] = json_hash['source'].map { |var| Reference.transform_json(var) } unless json_hash['source'].nil?

      result
    end
  end
end
