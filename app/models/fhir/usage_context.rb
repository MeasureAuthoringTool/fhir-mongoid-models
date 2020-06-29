module FHIR
  # fhir/usage_context.rb
  class UsageContext < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'UsageContext'
    embeds_one :code, class_name: 'Coding'
    embeds_one :valueCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :valueQuantity, class_name: 'Quantity'
    embeds_one :valueRange, class_name: 'Range'
    embeds_one :valueReference, class_name: 'Reference'

    def self.transform_json(json_hash, target=UsageContext.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = Coding.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['valueCodeableConcept'] = CodeableConcept.transform_json(json_hash['valueCodeableConcept']) unless json_hash['valueCodeableConcept'].nil?      
      result['valueQuantity'] = Quantity.transform_json(json_hash['valueQuantity']) unless json_hash['valueQuantity'].nil?      
      result['valueRange'] = Range.transform_json(json_hash['valueRange']) unless json_hash['valueRange'].nil?      
      result['valueReference'] = Reference.transform_json(json_hash['valueReference']) unless json_hash['valueReference'].nil?      

      result
    end
  end
end
