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
    
    def as_json(*args)
      result = super      
      unless self.entityCodeableConcept.nil?
        result['entityCodeableConcept'] = self.entityCodeableConcept.as_json(*args)                        
      end          
      unless self.entityReference.nil?
        result['entityReference'] = self.entityReference.as_json(*args)                        
      end          
      unless self.identifier.nil? 
        result['identifier'] = self.identifier.as_json(*args)
      end
      unless self.effectiveTime.nil? 
        result['effectiveTime'] = self.effectiveTime.value
        serialized = Extension.serializePrimitiveExtension(self.effectiveTime)            
        result['_effectiveTime'] = serialized unless serialized.nil?
      end
      unless self.quantity.nil? 
        result['quantity'] = self.quantity.as_json(*args)
      end
      unless self.unitPrice.nil? 
        result['unitPrice'] = self.unitPrice.as_json(*args)
      end
      unless self.factor.nil? 
        result['factor'] = self.factor.value
        serialized = Extension.serializePrimitiveExtension(self.factor)            
        result['_factor'] = serialized unless serialized.nil?
      end
      unless self.points.nil? 
        result['points'] = self.points.value
        serialized = Extension.serializePrimitiveExtension(self.points)            
        result['_points'] = serialized unless serialized.nil?
      end
      unless self.net.nil? 
        result['net'] = self.net.as_json(*args)
      end
      unless self.payment.nil? 
        result['payment'] = self.payment.value
        serialized = Extension.serializePrimitiveExtension(self.payment)            
        result['_payment'] = serialized unless serialized.nil?
      end
      unless self.paymentDate.nil? 
        result['paymentDate'] = self.paymentDate.value
        serialized = Extension.serializePrimitiveExtension(self.paymentDate)            
        result['_paymentDate'] = serialized unless serialized.nil?
      end
      unless self.responsible.nil? 
        result['responsible'] = self.responsible.as_json(*args)
      end
      unless self.recipient.nil? 
        result['recipient'] = self.recipient.as_json(*args)
      end
      unless self.linkId.nil?  || !self.linkId.any? 
        result['linkId'] = self.linkId.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.linkId)                              
        result['_linkId'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.securityLabelNumber.nil?  || !self.securityLabelNumber.any? 
        result['securityLabelNumber'] = self.securityLabelNumber.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.securityLabelNumber)                              
        result['_securityLabelNumber'] = serialized unless serialized.nil? || !serialized.any?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

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
