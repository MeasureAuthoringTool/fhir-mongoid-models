module FHIR
  # fhir/explanation_of_benefit_item_detail_sub_detail.rb
  class ExplanationOfBenefitItemDetailSubDetail < BackboneElement
    include Mongoid::Document
    embeds_one :sequence, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :revenue, class_name: 'FHIR::CodeableConcept'    
    embeds_one :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :productOrService, class_name: 'FHIR::CodeableConcept'    
    embeds_many :modifier, class_name: 'FHIR::CodeableConcept'    
    embeds_many :programCode, class_name: 'FHIR::CodeableConcept'    
    embeds_one :quantity, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :unitPrice, class_name: 'FHIR::Money'    
    embeds_one :factor, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :net, class_name: 'FHIR::Money'    
    embeds_many :udi, class_name: 'FHIR::Reference'    
    embeds_many :noteNumber, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_many :adjudication, class_name: 'FHIR::ExplanationOfBenefitItemAdjudication'    
    
    def as_json(*args)
      result = super      
      unless self.sequence.nil? 
        result['sequence'] = self.sequence.value
        serialized = Extension.serializePrimitiveExtension(self.sequence)            
        result['_sequence'] = serialized unless serialized.nil?
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
      unless self.noteNumber.nil?  || !self.noteNumber.any? 
        result['noteNumber'] = self.noteNumber.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.noteNumber)                              
        result['_noteNumber'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.adjudication.nil?  || !self.adjudication.any? 
        result['adjudication'] = self.adjudication.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ExplanationOfBenefitItemDetailSubDetail.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['sequence'] = PrimitivePositiveInt.transform_json(json_hash['sequence'], json_hash['_sequence']) unless json_hash['sequence'].nil?
      result['revenue'] = CodeableConcept.transform_json(json_hash['revenue']) unless json_hash['revenue'].nil?
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?
      result['productOrService'] = CodeableConcept.transform_json(json_hash['productOrService']) unless json_hash['productOrService'].nil?
      result['modifier'] = json_hash['modifier'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['modifier'].nil?
      result['programCode'] = json_hash['programCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['programCode'].nil?
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?
      result['unitPrice'] = Money.transform_json(json_hash['unitPrice']) unless json_hash['unitPrice'].nil?
      result['factor'] = PrimitiveDecimal.transform_json(json_hash['factor'], json_hash['_factor']) unless json_hash['factor'].nil?
      result['net'] = Money.transform_json(json_hash['net']) unless json_hash['net'].nil?
      result['udi'] = json_hash['udi'].map { |var| Reference.transform_json(var) } unless json_hash['udi'].nil?
      result['noteNumber'] = json_hash['noteNumber'].each_with_index.map do |var, i|
        extension_hash = json_hash['_noteNumber'] && json_hash['_noteNumber'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['noteNumber'].nil?
      result['adjudication'] = json_hash['adjudication'].map { |var| ExplanationOfBenefitItemAdjudication.transform_json(var) } unless json_hash['adjudication'].nil?

      result
    end
  end
end
