module FHIR
  # fhir/contract_term_offer_answer.rb
  class ContractTermOfferAnswer < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractTermOfferAnswer'
    embeds_one :valueboolean, class_name: 'PrimitiveBoolean'
    embeds_one :valuedecimal, class_name: 'PrimitiveDecimal'
    embeds_one :valueinteger, class_name: 'PrimitiveInteger'
    embeds_one :valuedate, class_name: 'PrimitiveDate'
    embeds_one :valuedateTime, class_name: 'PrimitiveDateTime'
    embeds_one :valuetime, class_name: 'PrimitiveTime'
    embeds_one :valuestring, class_name: 'PrimitiveString'
    embeds_one :valueuri, class_name: 'PrimitiveUri'
    embeds_one :valueAttachment, class_name: 'Attachment'
    embeds_one :valueCoding, class_name: 'Coding'
    embeds_one :valueQuantity, class_name: 'Quantity'
    embeds_one :valueReference, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = ContractTermOfferAnswer.new
      result['valueboolean'] = PrimitiveBoolean.transform_json(json_hash['valueboolean'], json_hash['_valueboolean']) unless json_hash['valueboolean'].nil?      
      result['valuedecimal'] = PrimitiveDecimal.transform_json(json_hash['valuedecimal'], json_hash['_valuedecimal']) unless json_hash['valuedecimal'].nil?      
      result['valueinteger'] = PrimitiveInteger.transform_json(json_hash['valueinteger'], json_hash['_valueinteger']) unless json_hash['valueinteger'].nil?      
      result['valuedate'] = PrimitiveDate.transform_json(json_hash['valuedate'], json_hash['_valuedate']) unless json_hash['valuedate'].nil?      
      result['valuedateTime'] = PrimitiveDateTime.transform_json(json_hash['valuedateTime'], json_hash['_valuedateTime']) unless json_hash['valuedateTime'].nil?      
      result['valuetime'] = PrimitiveTime.transform_json(json_hash['valuetime'], json_hash['_valuetime']) unless json_hash['valuetime'].nil?      
      result['valuestring'] = PrimitiveString.transform_json(json_hash['valuestring'], json_hash['_valuestring']) unless json_hash['valuestring'].nil?      
      result['valueuri'] = PrimitiveUri.transform_json(json_hash['valueuri'], json_hash['_valueuri']) unless json_hash['valueuri'].nil?      
      result['valueAttachment'] = Attachment.transform_json(json_hash['valueAttachment']) unless json_hash['valueAttachment'].nil?      
      result['valueCoding'] = Coding.transform_json(json_hash['valueCoding']) unless json_hash['valueCoding'].nil?      
      result['valueQuantity'] = Quantity.transform_json(json_hash['valueQuantity']) unless json_hash['valueQuantity'].nil?      
      result['valueReference'] = Reference.transform_json(json_hash['valueReference']) unless json_hash['valueReference'].nil?      

      result
    end
  end
end
