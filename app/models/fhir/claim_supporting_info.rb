module FHIR
  # fhir/claim_supporting_info.rb
  class ClaimSupportingInfo < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ClaimSupportingInfo'
    embeds_one :sequence, class_name: 'PrimitivePositiveInt'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :timingdate, class_name: 'PrimitiveDate'
    embeds_one :timingPeriod, class_name: 'Period'
    embeds_one :valueboolean, class_name: 'PrimitiveBoolean'
    embeds_one :valuestring, class_name: 'PrimitiveString'
    embeds_one :valueQuantity, class_name: 'Quantity'
    embeds_one :valueAttachment, class_name: 'Attachment'
    embeds_one :valueReference, class_name: 'Reference'
    embeds_one :reason, class_name: 'CodeableConcept'

    def self.transform_json(json_hash)
      result = ClaimSupportingInfo.new
      result['sequence'] = PrimitivePositiveInt.transform_json(json_hash['sequence'], json_hash['_sequence']) unless json_hash['sequence'].nil?      
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?      
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['timingdate'] = PrimitiveDate.transform_json(json_hash['timingdate'], json_hash['_timingdate']) unless json_hash['timingdate'].nil?      
      result['timingPeriod'] = Period.transform_json(json_hash['timingPeriod']) unless json_hash['timingPeriod'].nil?      
      result['valueboolean'] = PrimitiveBoolean.transform_json(json_hash['valueboolean'], json_hash['_valueboolean']) unless json_hash['valueboolean'].nil?      
      result['valuestring'] = PrimitiveString.transform_json(json_hash['valuestring'], json_hash['_valuestring']) unless json_hash['valuestring'].nil?      
      result['valueQuantity'] = Quantity.transform_json(json_hash['valueQuantity']) unless json_hash['valueQuantity'].nil?      
      result['valueAttachment'] = Attachment.transform_json(json_hash['valueAttachment']) unless json_hash['valueAttachment'].nil?      
      result['valueReference'] = Reference.transform_json(json_hash['valueReference']) unless json_hash['valueReference'].nil?      
      result['reason'] = CodeableConcept.transform_json(json_hash['reason']) unless json_hash['reason'].nil?      

      result
    end
  end
end
