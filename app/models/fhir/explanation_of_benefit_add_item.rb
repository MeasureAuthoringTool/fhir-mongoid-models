module FHIR
  # fhir/explanation_of_benefit_add_item.rb
  class ExplanationOfBenefitAddItem < BackboneElement
    include Mongoid::Document
    embeds_many :itemSequence, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_many :detailSequence, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_many :subDetailSequence, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_many :provider, class_name: 'FHIR::Reference'    
    embeds_one :productOrService, class_name: 'FHIR::CodeableConcept'    
    embeds_many :modifier, class_name: 'FHIR::CodeableConcept'    
    embeds_many :programCode, class_name: 'FHIR::CodeableConcept'    
    embeds_one :servicedDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :servicedPeriod, class_name: 'FHIR::Period'    
    embeds_one :locationCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :locationAddress, class_name: 'FHIR::Address'    
    embeds_one :locationReference, class_name: 'FHIR::Reference'    
    embeds_one :quantity, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :unitPrice, class_name: 'FHIR::Money'    
    embeds_one :factor, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :net, class_name: 'FHIR::Money'    
    embeds_one :bodySite, class_name: 'FHIR::CodeableConcept'    
    embeds_many :subSite, class_name: 'FHIR::CodeableConcept'    
    embeds_many :noteNumber, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_many :adjudication, class_name: 'FHIR::ExplanationOfBenefitItemAdjudication'    
    embeds_many :detail, class_name: 'FHIR::ExplanationOfBenefitAddItemDetail'    
    
    def as_json(*args)
      result = super      
      unless self.itemSequence.nil?  || !self.itemSequence.any? 
        result['itemSequence'] = self.itemSequence.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.itemSequence)                              
        result['_itemSequence'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.detailSequence.nil?  || !self.detailSequence.any? 
        result['detailSequence'] = self.detailSequence.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.detailSequence)                              
        result['_detailSequence'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.subDetailSequence.nil?  || !self.subDetailSequence.any? 
        result['subDetailSequence'] = self.subDetailSequence.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.subDetailSequence)                              
        result['_subDetailSequence'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.provider.nil?  || !self.provider.any? 
        result['provider'] = self.provider.map{ |x| x.as_json(*args) }
      end
      unless self.productOrService.nil? 
        result['productOrService'] = self.productOrService.as_json(*args)
      end
      unless self.modifier.nil?  || !self.modifier.any? 
        result['modifier'] = self.modifier.map{ |x| x.as_json(*args) }
      end
      unless self.programCode.nil?  || !self.programCode.any? 
        result['programCode'] = self.programCode.map{ |x| x.as_json(*args) }
      end
      unless self.servicedDate.nil?
        result['servicedDate'] = self.servicedDate.value                        
        serialized = Extension.serializePrimitiveExtension(self.servicedDate) 
        result['_servicedDate'] = serialized unless serialized.nil?
      end          
      unless self.servicedPeriod.nil?
        result['servicedPeriod'] = self.servicedPeriod.as_json(*args)                        
      end          
      unless self.locationCodeableConcept.nil?
        result['locationCodeableConcept'] = self.locationCodeableConcept.as_json(*args)                        
      end          
      unless self.locationAddress.nil?
        result['locationAddress'] = self.locationAddress.as_json(*args)                        
      end          
      unless self.locationReference.nil?
        result['locationReference'] = self.locationReference.as_json(*args)                        
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
      unless self.net.nil? 
        result['net'] = self.net.as_json(*args)
      end
      unless self.bodySite.nil? 
        result['bodySite'] = self.bodySite.as_json(*args)
      end
      unless self.subSite.nil?  || !self.subSite.any? 
        result['subSite'] = self.subSite.map{ |x| x.as_json(*args) }
      end
      unless self.noteNumber.nil?  || !self.noteNumber.any? 
        result['noteNumber'] = self.noteNumber.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.noteNumber)                              
        result['_noteNumber'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.adjudication.nil?  || !self.adjudication.any? 
        result['adjudication'] = self.adjudication.map{ |x| x.as_json(*args) }
      end
      unless self.detail.nil?  || !self.detail.any? 
        result['detail'] = self.detail.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ExplanationOfBenefitAddItem.new)
      result = self.superclass.transform_json(json_hash, target)
      result['itemSequence'] = json_hash['itemSequence'].each_with_index.map do |var, i|
        extension_hash = json_hash['_itemSequence'] && json_hash['_itemSequence'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['itemSequence'].nil?
      result['detailSequence'] = json_hash['detailSequence'].each_with_index.map do |var, i|
        extension_hash = json_hash['_detailSequence'] && json_hash['_detailSequence'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['detailSequence'].nil?
      result['subDetailSequence'] = json_hash['subDetailSequence'].each_with_index.map do |var, i|
        extension_hash = json_hash['_subDetailSequence'] && json_hash['_subDetailSequence'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['subDetailSequence'].nil?
      result['provider'] = json_hash['provider'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['provider'].nil?
      result['productOrService'] = CodeableConcept.transform_json(json_hash['productOrService']) unless json_hash['productOrService'].nil?
      result['modifier'] = json_hash['modifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['modifier'].nil?
      result['programCode'] = json_hash['programCode'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['programCode'].nil?
      result['servicedDate'] = PrimitiveDate.transform_json(json_hash['servicedDate'], json_hash['_servicedDate']) unless json_hash['servicedDate'].nil?
      result['servicedPeriod'] = Period.transform_json(json_hash['servicedPeriod']) unless json_hash['servicedPeriod'].nil?
      result['locationCodeableConcept'] = CodeableConcept.transform_json(json_hash['locationCodeableConcept']) unless json_hash['locationCodeableConcept'].nil?
      result['locationAddress'] = Address.transform_json(json_hash['locationAddress']) unless json_hash['locationAddress'].nil?
      result['locationReference'] = Reference.transform_json(json_hash['locationReference']) unless json_hash['locationReference'].nil?
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?
      result['unitPrice'] = Money.transform_json(json_hash['unitPrice']) unless json_hash['unitPrice'].nil?
      result['factor'] = PrimitiveDecimal.transform_json(json_hash['factor'], json_hash['_factor']) unless json_hash['factor'].nil?
      result['net'] = Money.transform_json(json_hash['net']) unless json_hash['net'].nil?
      result['bodySite'] = CodeableConcept.transform_json(json_hash['bodySite']) unless json_hash['bodySite'].nil?
      result['subSite'] = json_hash['subSite'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['subSite'].nil?
      result['noteNumber'] = json_hash['noteNumber'].each_with_index.map do |var, i|
        extension_hash = json_hash['_noteNumber'] && json_hash['_noteNumber'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['noteNumber'].nil?
      result['adjudication'] = json_hash['adjudication'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ExplanationOfBenefitItemAdjudication.transform_json(var) 
        end
      } unless json_hash['adjudication'].nil?
      result['detail'] = json_hash['detail'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ExplanationOfBenefitAddItemDetail.transform_json(var) 
        end
      } unless json_hash['detail'].nil?

      result
    end
  end
end
