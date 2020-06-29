module FHIR
  # fhir/explanation_of_benefit_supporting_info.rb
  class ExplanationOfBenefitSupportingInfo < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExplanationOfBenefitSupportingInfo'
    embeds_one :sequence, class_name: 'PrimitivePositiveInt'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :timingDate, class_name: 'PrimitiveDate'
    embeds_one :timingPeriod, class_name: 'Period'
    embeds_one :valueBoolean, class_name: 'PrimitiveBoolean'
    embeds_one :valueString, class_name: 'PrimitiveString'
    embeds_one :valueQuantity, class_name: 'Quantity'
    embeds_one :valueAttachment, class_name: 'Attachment'
    embeds_one :valueReference, class_name: 'Reference'
    embeds_one :reason, class_name: 'Coding'

    def self.transform_json(json_hash, target=ExplanationOfBenefitSupportingInfo.new)
      result = self.superclass.transform_json(json_hash, target)
      result['sequence'] = PrimitivePositiveInt.transform_json(json_hash['sequence'], json_hash['_sequence']) unless json_hash['sequence'].nil?      
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?      
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['timingDate'] = PrimitiveDate.transform_json(json_hash['timingDate'], json_hash['_timingDate']) unless json_hash['timingDate'].nil?      
      result['timingPeriod'] = Period.transform_json(json_hash['timingPeriod']) unless json_hash['timingPeriod'].nil?      
      result['valueBoolean'] = PrimitiveBoolean.transform_json(json_hash['valueBoolean'], json_hash['_valueBoolean']) unless json_hash['valueBoolean'].nil?      
      result['valueString'] = PrimitiveString.transform_json(json_hash['valueString'], json_hash['_valueString']) unless json_hash['valueString'].nil?      
      result['valueQuantity'] = Quantity.transform_json(json_hash['valueQuantity']) unless json_hash['valueQuantity'].nil?      
      result['valueAttachment'] = Attachment.transform_json(json_hash['valueAttachment']) unless json_hash['valueAttachment'].nil?      
      result['valueReference'] = Reference.transform_json(json_hash['valueReference']) unless json_hash['valueReference'].nil?      
      result['reason'] = Coding.transform_json(json_hash['reason']) unless json_hash['reason'].nil?      

      result
    end
  end
end
