module FHIR
  # fhir/contract_term_asset_valued_item.rb
  class ContractTermAssetValuedItem < BackboneElement
    include Mongoid::Document
    embeds_one :entityCodeableConcept, class_name: 'FHIR::CodeableConcept'
    embeds_one :entityReference, class_name: 'FHIR::Reference'
    embeds_one :identifier, class_name: 'FHIR::Identifier'
    embeds_one :effectiveTime, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :quantity, class_name: 'FHIR::SimpleQuantity'
    embeds_one :unitPrice, class_name: 'FHIR::Money'
    embeds_one :factor, class_name: 'FHIR::PrimitiveDecimal'
    embeds_one :points, class_name: 'FHIR::PrimitiveDecimal'
    embeds_one :net, class_name: 'FHIR::Money'
    embeds_one :payment, class_name: 'FHIR::PrimitiveString'
    embeds_one :paymentDate, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :responsible, class_name: 'FHIR::Reference'
    embeds_one :recipient, class_name: 'FHIR::Reference'
    embeds_many :linkId, class_name: 'FHIR::PrimitiveString'
    embeds_many :securityLabelNumber, class_name: 'FHIR::PrimitiveUnsignedInt'

    def self.transform_json(json_hash, target = ContractTermAssetValuedItem.new)
      result = self.superclass.transform_json(json_hash, target)
      result['entityCodeableConcept'] = CodeableConcept.transform_json(json_hash['entityCodeableConcept']) unless json_hash['entityCodeableConcept'].nil?      
      result['entityReference'] = Reference.transform_json(json_hash['entityReference']) unless json_hash['entityReference'].nil?      
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?      
      result['effectiveTime'] = PrimitiveDateTime.transform_json(json_hash['effectiveTime'], json_hash['_effectiveTime']) unless json_hash['effectiveTime'].nil?      
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      
      result['unitPrice'] = Money.transform_json(json_hash['unitPrice']) unless json_hash['unitPrice'].nil?      
      result['factor'] = PrimitiveDecimal.transform_json(json_hash['factor'], json_hash['_factor']) unless json_hash['factor'].nil?      
      result['points'] = PrimitiveDecimal.transform_json(json_hash['points'], json_hash['_points']) unless json_hash['points'].nil?      
      result['net'] = Money.transform_json(json_hash['net']) unless json_hash['net'].nil?      
      result['payment'] = PrimitiveString.transform_json(json_hash['payment'], json_hash['_payment']) unless json_hash['payment'].nil?      
      result['paymentDate'] = PrimitiveDateTime.transform_json(json_hash['paymentDate'], json_hash['_paymentDate']) unless json_hash['paymentDate'].nil?      
      result['responsible'] = Reference.transform_json(json_hash['responsible']) unless json_hash['responsible'].nil?      
      result['recipient'] = Reference.transform_json(json_hash['recipient']) unless json_hash['recipient'].nil?      
      result['linkId'] = json_hash['linkId'].each_with_index.map do |var, i|
        extension_hash = json_hash['_linkId'] && json_hash['_linkId'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['linkId'].nil?
      result['securityLabelNumber'] = json_hash['securityLabelNumber'].each_with_index.map do |var, i|
        extension_hash = json_hash['_securityLabelNumber'] && json_hash['_securityLabelNumber'][i]
        PrimitiveUnsignedInt.transform_json(var, extension_hash)
      end unless json_hash['securityLabelNumber'].nil?

      result
    end
  end
end
