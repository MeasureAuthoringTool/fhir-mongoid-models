module FHIR
  # fhir/explanation_of_benefit_item.rb
  class ExplanationOfBenefitItem < BackboneElement
    include Mongoid::Document
    embeds_one :sequence, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_many :careTeamSequence, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_many :diagnosisSequence, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_many :procedureSequence, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_many :informationSequence, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :revenue, class_name: 'FHIR::CodeableConcept'    
    embeds_one :category, class_name: 'FHIR::CodeableConcept'    
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
    embeds_many :udi, class_name: 'FHIR::Reference'    
    embeds_one :bodySite, class_name: 'FHIR::CodeableConcept'    
    embeds_many :subSite, class_name: 'FHIR::CodeableConcept'    
    embeds_many :encounter, class_name: 'FHIR::Reference'    
    embeds_many :noteNumber, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_many :adjudication, class_name: 'FHIR::ExplanationOfBenefitItemAdjudication'    
    embeds_many :detail, class_name: 'FHIR::ExplanationOfBenefitItemDetail'    
    
    def as_json(*args)
      result = super      
      unless self.sequence.nil? 
        result['sequence'] = self.sequence.value
        serialized = Extension.serializePrimitiveExtension(self.sequence)            
        result['_sequence'] = serialized unless serialized.nil?
      end
      unless self.careTeamSequence.nil?  || !self.careTeamSequence.any? 
        result['careTeamSequence'] = self.careTeamSequence.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.careTeamSequence)                              
        result['_careTeamSequence'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.diagnosisSequence.nil?  || !self.diagnosisSequence.any? 
        result['diagnosisSequence'] = self.diagnosisSequence.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.diagnosisSequence)                              
        result['_diagnosisSequence'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.procedureSequence.nil?  || !self.procedureSequence.any? 
        result['procedureSequence'] = self.procedureSequence.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.procedureSequence)                              
        result['_procedureSequence'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.informationSequence.nil?  || !self.informationSequence.any? 
        result['informationSequence'] = self.informationSequence.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.informationSequence)                              
        result['_informationSequence'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.revenue.nil? 
        result['revenue'] = self.revenue.as_json(*args)
      end
      unless self.category.nil? 
        result['category'] = self.category.as_json(*args)
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
      unless self.udi.nil?  || !self.udi.any? 
        result['udi'] = self.udi.map{ |x| x.as_json(*args) }
      end
      unless self.bodySite.nil? 
        result['bodySite'] = self.bodySite.as_json(*args)
      end
      unless self.subSite.nil?  || !self.subSite.any? 
        result['subSite'] = self.subSite.map{ |x| x.as_json(*args) }
      end
      unless self.encounter.nil?  || !self.encounter.any? 
        result['encounter'] = self.encounter.map{ |x| x.as_json(*args) }
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

    def self.transform_json(json_hash, target = ExplanationOfBenefitItem.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['sequence'] = PrimitivePositiveInt.transform_json(json_hash['sequence'], json_hash['_sequence']) unless json_hash['sequence'].nil?
      result['careTeamSequence'] = json_hash['careTeamSequence'].each_with_index.map do |var, i|
        extension_hash = json_hash['_careTeamSequence'] && json_hash['_careTeamSequence'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['careTeamSequence'].nil?
      result['diagnosisSequence'] = json_hash['diagnosisSequence'].each_with_index.map do |var, i|
        extension_hash = json_hash['_diagnosisSequence'] && json_hash['_diagnosisSequence'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['diagnosisSequence'].nil?
      result['procedureSequence'] = json_hash['procedureSequence'].each_with_index.map do |var, i|
        extension_hash = json_hash['_procedureSequence'] && json_hash['_procedureSequence'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['procedureSequence'].nil?
      result['informationSequence'] = json_hash['informationSequence'].each_with_index.map do |var, i|
        extension_hash = json_hash['_informationSequence'] && json_hash['_informationSequence'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['informationSequence'].nil?
      result['revenue'] = CodeableConcept.transform_json(json_hash['revenue']) unless json_hash['revenue'].nil?
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?
      result['productOrService'] = CodeableConcept.transform_json(json_hash['productOrService']) unless json_hash['productOrService'].nil?
      result['modifier'] = json_hash['modifier'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['modifier'].nil?
      result['programCode'] = json_hash['programCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['programCode'].nil?
      result['servicedDate'] = PrimitiveDate.transform_json(json_hash['servicedDate'], json_hash['_servicedDate']) unless json_hash['servicedDate'].nil?
      result['servicedPeriod'] = Period.transform_json(json_hash['servicedPeriod']) unless json_hash['servicedPeriod'].nil?
      result['locationCodeableConcept'] = CodeableConcept.transform_json(json_hash['locationCodeableConcept']) unless json_hash['locationCodeableConcept'].nil?
      result['locationAddress'] = Address.transform_json(json_hash['locationAddress']) unless json_hash['locationAddress'].nil?
      result['locationReference'] = Reference.transform_json(json_hash['locationReference']) unless json_hash['locationReference'].nil?
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?
      result['unitPrice'] = Money.transform_json(json_hash['unitPrice']) unless json_hash['unitPrice'].nil?
      result['factor'] = PrimitiveDecimal.transform_json(json_hash['factor'], json_hash['_factor']) unless json_hash['factor'].nil?
      result['net'] = Money.transform_json(json_hash['net']) unless json_hash['net'].nil?
      result['udi'] = json_hash['udi'].map { |var| Reference.transform_json(var) } unless json_hash['udi'].nil?
      result['bodySite'] = CodeableConcept.transform_json(json_hash['bodySite']) unless json_hash['bodySite'].nil?
      result['subSite'] = json_hash['subSite'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['subSite'].nil?
      result['encounter'] = json_hash['encounter'].map { |var| Reference.transform_json(var) } unless json_hash['encounter'].nil?
      result['noteNumber'] = json_hash['noteNumber'].each_with_index.map do |var, i|
        extension_hash = json_hash['_noteNumber'] && json_hash['_noteNumber'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['noteNumber'].nil?
      result['adjudication'] = json_hash['adjudication'].map { |var| ExplanationOfBenefitItemAdjudication.transform_json(var) } unless json_hash['adjudication'].nil?
      result['detail'] = json_hash['detail'].map { |var| ExplanationOfBenefitItemDetail.transform_json(var) } unless json_hash['detail'].nil?

      result
    end
  end
end
