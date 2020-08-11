module FHIR
  # fhir/coverage.rb
  class Coverage < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::CoverageStatus'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :policyHolder, class_name: 'FHIR::Reference'    
    embeds_one :subscriber, class_name: 'FHIR::Reference'    
    embeds_one :subscriberId, class_name: 'FHIR::PrimitiveString'    
    embeds_one :beneficiary, class_name: 'FHIR::Reference'    
    embeds_one :dependent, class_name: 'FHIR::PrimitiveString'    
    embeds_one :relationship, class_name: 'FHIR::CodeableConcept'    
    embeds_one :period, class_name: 'FHIR::Period'    
    embeds_many :payor, class_name: 'FHIR::Reference'    
    embeds_many :class_local, class_name: 'FHIR::CoverageClass'    
    embeds_one :order, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :network, class_name: 'FHIR::PrimitiveString'    
    embeds_many :costToBeneficiary, class_name: 'FHIR::CoverageCostToBeneficiary'    
    embeds_one :subrogation, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_many :contract, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.policyHolder.nil? 
        result['policyHolder'] = self.policyHolder.as_json(*args)
      end
      unless self.subscriber.nil? 
        result['subscriber'] = self.subscriber.as_json(*args)
      end
      unless self.subscriberId.nil? 
        result['subscriberId'] = self.subscriberId.value
        serialized = Extension.serializePrimitiveExtension(self.subscriberId)            
        result['_subscriberId'] = serialized unless serialized.nil?
      end
      unless self.beneficiary.nil? 
        result['beneficiary'] = self.beneficiary.as_json(*args)
      end
      unless self.dependent.nil? 
        result['dependent'] = self.dependent.value
        serialized = Extension.serializePrimitiveExtension(self.dependent)            
        result['_dependent'] = serialized unless serialized.nil?
      end
      unless self.relationship.nil? 
        result['relationship'] = self.relationship.as_json(*args)
      end
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      unless self.payor.nil?  || !self.payor.any? 
        result['payor'] = self.payor.map{ |x| x.as_json(*args) }
      end
      unless self.class_local.nil?  || !self.class_local.any? 
        result['class'] = self.class_local.map{ |x| x.as_json(*args) }
      end
      unless self.order.nil? 
        result['order'] = self.order.value
        serialized = Extension.serializePrimitiveExtension(self.order)            
        result['_order'] = serialized unless serialized.nil?
      end
      unless self.network.nil? 
        result['network'] = self.network.value
        serialized = Extension.serializePrimitiveExtension(self.network)            
        result['_network'] = serialized unless serialized.nil?
      end
      unless self.costToBeneficiary.nil?  || !self.costToBeneficiary.any? 
        result['costToBeneficiary'] = self.costToBeneficiary.map{ |x| x.as_json(*args) }
      end
      unless self.subrogation.nil? 
        result['subrogation'] = self.subrogation.value
        serialized = Extension.serializePrimitiveExtension(self.subrogation)            
        result['_subrogation'] = serialized unless serialized.nil?
      end
      unless self.contract.nil?  || !self.contract.any? 
        result['contract'] = self.contract.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Coverage.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = CoverageStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['policyHolder'] = Reference.transform_json(json_hash['policyHolder']) unless json_hash['policyHolder'].nil?
      result['subscriber'] = Reference.transform_json(json_hash['subscriber']) unless json_hash['subscriber'].nil?
      result['subscriberId'] = PrimitiveString.transform_json(json_hash['subscriberId'], json_hash['_subscriberId']) unless json_hash['subscriberId'].nil?
      result['beneficiary'] = Reference.transform_json(json_hash['beneficiary']) unless json_hash['beneficiary'].nil?
      result['dependent'] = PrimitiveString.transform_json(json_hash['dependent'], json_hash['_dependent']) unless json_hash['dependent'].nil?
      result['relationship'] = CodeableConcept.transform_json(json_hash['relationship']) unless json_hash['relationship'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?
      result['payor'] = json_hash['payor'].map { |var| Reference.transform_json(var) } unless json_hash['payor'].nil?
      result['class_local'] = json_hash['class'].map { |var| CoverageClass.transform_json(var) } unless json_hash['class'].nil?
      result['order'] = PrimitivePositiveInt.transform_json(json_hash['order'], json_hash['_order']) unless json_hash['order'].nil?
      result['network'] = PrimitiveString.transform_json(json_hash['network'], json_hash['_network']) unless json_hash['network'].nil?
      result['costToBeneficiary'] = json_hash['costToBeneficiary'].map { |var| CoverageCostToBeneficiary.transform_json(var) } unless json_hash['costToBeneficiary'].nil?
      result['subrogation'] = PrimitiveBoolean.transform_json(json_hash['subrogation'], json_hash['_subrogation']) unless json_hash['subrogation'].nil?
      result['contract'] = json_hash['contract'].map { |var| Reference.transform_json(var) } unless json_hash['contract'].nil?

      result
    end
  end
end
