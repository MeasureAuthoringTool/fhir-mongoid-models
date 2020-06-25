module FHIR
  # fhir/substance_reference_information_target.rb
  class SubstanceReferenceInformationTarget < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceReferenceInformationTarget'
    embeds_one :target, class_name: 'Identifier'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :interaction, class_name: 'CodeableConcept'
    embeds_one :organism, class_name: 'CodeableConcept'
    embeds_one :organismType, class_name: 'CodeableConcept'
    embeds_one :amountQuantity, class_name: 'Quantity'
    embeds_one :amountRange, class_name: 'Range'
    embeds_one :amountstring, class_name: 'PrimitiveString'
    embeds_one :amountType, class_name: 'CodeableConcept'
    embeds_many :source, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = SubstanceReferenceInformationTarget.new
      result['target'] = Identifier.transform_json(json_hash['target']) unless json_hash['target'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['interaction'] = CodeableConcept.transform_json(json_hash['interaction']) unless json_hash['interaction'].nil?      
      result['organism'] = CodeableConcept.transform_json(json_hash['organism']) unless json_hash['organism'].nil?      
      result['organismType'] = CodeableConcept.transform_json(json_hash['organismType']) unless json_hash['organismType'].nil?      
      result['amountQuantity'] = Quantity.transform_json(json_hash['amountQuantity']) unless json_hash['amountQuantity'].nil?      
      result['amountRange'] = Range.transform_json(json_hash['amountRange']) unless json_hash['amountRange'].nil?      
      result['amountstring'] = PrimitiveString.transform_json(json_hash['amountstring'], json_hash['_amountstring']) unless json_hash['amountstring'].nil?      
      result['amountType'] = CodeableConcept.transform_json(json_hash['amountType']) unless json_hash['amountType'].nil?      
      result['source'] = json_hash['source'].map { |var| Reference.transform_json(var) } unless json_hash['source'].nil?

      result
    end
  end
end
