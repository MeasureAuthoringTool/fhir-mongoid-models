module FHIR
  # fhir/contract_term_offer_answer.rb
  class ContractTermOfferAnswer < BackboneElement
    include Mongoid::Document
    embeds_one :valueBoolean, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :valueDecimal, class_name: 'FHIR::PrimitiveDecimal'
    embeds_one :valueInteger, class_name: 'FHIR::PrimitiveInteger'
    embeds_one :valueDate, class_name: 'FHIR::PrimitiveDate'
    embeds_one :valueDateTime, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :valueTime, class_name: 'FHIR::PrimitiveTime'
    embeds_one :valueString, class_name: 'FHIR::PrimitiveString'
    embeds_one :valueUri, class_name: 'FHIR::PrimitiveUri'
    embeds_one :valueAttachment, class_name: 'FHIR::Attachment'
    embeds_one :valueCoding, class_name: 'FHIR::Coding'
    embeds_one :valueQuantity, class_name: 'FHIR::Quantity'
    embeds_one :valueReference, class_name: 'FHIR::Reference'

    def self.transform_json(json_hash, target = ContractTermOfferAnswer.new)
      result = self.superclass.transform_json(json_hash, target)
      result['valueBoolean'] = PrimitiveBoolean.transform_json(json_hash['valueBoolean'], json_hash['_valueBoolean']) unless json_hash['valueBoolean'].nil?      
      result['valueDecimal'] = PrimitiveDecimal.transform_json(json_hash['valueDecimal'], json_hash['_valueDecimal']) unless json_hash['valueDecimal'].nil?      
      result['valueInteger'] = PrimitiveInteger.transform_json(json_hash['valueInteger'], json_hash['_valueInteger']) unless json_hash['valueInteger'].nil?      
      result['valueDate'] = PrimitiveDate.transform_json(json_hash['valueDate'], json_hash['_valueDate']) unless json_hash['valueDate'].nil?      
      result['valueDateTime'] = PrimitiveDateTime.transform_json(json_hash['valueDateTime'], json_hash['_valueDateTime']) unless json_hash['valueDateTime'].nil?      
      result['valueTime'] = PrimitiveTime.transform_json(json_hash['valueTime'], json_hash['_valueTime']) unless json_hash['valueTime'].nil?      
      result['valueString'] = PrimitiveString.transform_json(json_hash['valueString'], json_hash['_valueString']) unless json_hash['valueString'].nil?      
      result['valueUri'] = PrimitiveUri.transform_json(json_hash['valueUri'], json_hash['_valueUri']) unless json_hash['valueUri'].nil?      
      result['valueAttachment'] = Attachment.transform_json(json_hash['valueAttachment']) unless json_hash['valueAttachment'].nil?      
      result['valueCoding'] = Coding.transform_json(json_hash['valueCoding']) unless json_hash['valueCoding'].nil?      
      result['valueQuantity'] = Quantity.transform_json(json_hash['valueQuantity']) unless json_hash['valueQuantity'].nil?      
      result['valueReference'] = Reference.transform_json(json_hash['valueReference']) unless json_hash['valueReference'].nil?      

      result
    end
  end
end
