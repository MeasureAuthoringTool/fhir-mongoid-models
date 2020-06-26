module FHIR
  # fhir/substance_specification_relationship.rb
  class SubstanceSpecificationRelationship < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSpecificationRelationship'
    embeds_one :substanceReference, class_name: 'Reference'
    embeds_one :substanceCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :relationship, class_name: 'CodeableConcept'
    embeds_one :isDefining, class_name: 'PrimitiveBoolean'
    embeds_one :amountQuantity, class_name: 'Quantity'
    embeds_one :amountRange, class_name: 'Range'
    embeds_one :amountRatio, class_name: 'Ratio'
    embeds_one :amountstring, class_name: 'PrimitiveString'
    embeds_one :amountRatioLowLimit, class_name: 'Ratio'
    embeds_one :amountType, class_name: 'CodeableConcept'
    embeds_many :source, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = SubstanceSpecificationRelationship.new
      result['substanceReference'] = Reference.transform_json(json_hash['substanceReference']) unless json_hash['substanceReference'].nil?      
      result['substanceCodeableConcept'] = CodeableConcept.transform_json(json_hash['substanceCodeableConcept']) unless json_hash['substanceCodeableConcept'].nil?      
      result['relationship'] = CodeableConcept.transform_json(json_hash['relationship']) unless json_hash['relationship'].nil?      
      result['isDefining'] = PrimitiveBoolean.transform_json(json_hash['isDefining'], json_hash['_isDefining']) unless json_hash['isDefining'].nil?      
      result['amountQuantity'] = Quantity.transform_json(json_hash['amountQuantity']) unless json_hash['amountQuantity'].nil?      
      result['amountRange'] = Range.transform_json(json_hash['amountRange']) unless json_hash['amountRange'].nil?      
      result['amountRatio'] = Ratio.transform_json(json_hash['amountRatio']) unless json_hash['amountRatio'].nil?      
      result['amountstring'] = PrimitiveString.transform_json(json_hash['amountstring'], json_hash['_amountstring']) unless json_hash['amountstring'].nil?      
      result['amountRatioLowLimit'] = Ratio.transform_json(json_hash['amountRatioLowLimit']) unless json_hash['amountRatioLowLimit'].nil?      
      result['amountType'] = CodeableConcept.transform_json(json_hash['amountType']) unless json_hash['amountType'].nil?      
      result['source'] = json_hash['source'].map { |var| Reference.transform_json(var) } unless json_hash['source'].nil?

      result
    end
  end
end
