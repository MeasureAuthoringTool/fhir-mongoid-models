module FHIR
  # fhir/consent.rb
  class Consent < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::ConsentState'    
    embeds_one :scope, class_name: 'FHIR::CodeableConcept'    
    embeds_many :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :patient, class_name: 'FHIR::Reference'    
    embeds_one :dateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_many :performer, class_name: 'FHIR::Reference'    
    embeds_many :organization, class_name: 'FHIR::Reference'    
    embeds_one :sourceAttachment, class_name: 'FHIR::Attachment'    
    embeds_one :sourceReference, class_name: 'FHIR::Reference'    
    embeds_many :policy, class_name: 'FHIR::ConsentPolicy'    
    embeds_one :policyRule, class_name: 'FHIR::CodeableConcept'    
    embeds_many :verification, class_name: 'FHIR::ConsentVerification'    
    embeds_one :provision, class_name: 'FHIR::ConsentProvision'    
    
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
      unless self.scope.nil? 
        result['scope'] = self.scope.as_json(*args)
      end
      unless self.category.nil?  || !self.category.any? 
        result['category'] = self.category.map{ |x| x.as_json(*args) }
      end
      unless self.patient.nil? 
        result['patient'] = self.patient.as_json(*args)
      end
      unless self.dateTime.nil? 
        result['dateTime'] = self.dateTime.value
        serialized = Extension.serializePrimitiveExtension(self.dateTime)            
        result['_dateTime'] = serialized unless serialized.nil?
      end
      unless self.performer.nil?  || !self.performer.any? 
        result['performer'] = self.performer.map{ |x| x.as_json(*args) }
      end
      unless self.organization.nil?  || !self.organization.any? 
        result['organization'] = self.organization.map{ |x| x.as_json(*args) }
      end
      unless self.sourceAttachment.nil?
        result['sourceAttachment'] = self.sourceAttachment.as_json(*args)                        
      end          
      unless self.sourceReference.nil?
        result['sourceReference'] = self.sourceReference.as_json(*args)                        
      end          
      unless self.policy.nil?  || !self.policy.any? 
        result['policy'] = self.policy.map{ |x| x.as_json(*args) }
      end
      unless self.policyRule.nil? 
        result['policyRule'] = self.policyRule.as_json(*args)
      end
      unless self.verification.nil?  || !self.verification.any? 
        result['verification'] = self.verification.map{ |x| x.as_json(*args) }
      end
      unless self.provision.nil? 
        result['provision'] = self.provision.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Consent.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = ConsentState.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['scope'] = CodeableConcept.transform_json(json_hash['scope']) unless json_hash['scope'].nil?
      result['category'] = json_hash['category'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['category'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?
      result['dateTime'] = PrimitiveDateTime.transform_json(json_hash['dateTime'], json_hash['_dateTime']) unless json_hash['dateTime'].nil?
      result['performer'] = json_hash['performer'].map { |var| Reference.transform_json(var) } unless json_hash['performer'].nil?
      result['organization'] = json_hash['organization'].map { |var| Reference.transform_json(var) } unless json_hash['organization'].nil?
      result['sourceAttachment'] = Attachment.transform_json(json_hash['sourceAttachment']) unless json_hash['sourceAttachment'].nil?
      result['sourceReference'] = Reference.transform_json(json_hash['sourceReference']) unless json_hash['sourceReference'].nil?
      result['policy'] = json_hash['policy'].map { |var| ConsentPolicy.transform_json(var) } unless json_hash['policy'].nil?
      result['policyRule'] = CodeableConcept.transform_json(json_hash['policyRule']) unless json_hash['policyRule'].nil?
      result['verification'] = json_hash['verification'].map { |var| ConsentVerification.transform_json(var) } unless json_hash['verification'].nil?
      result['provision'] = ConsentProvision.transform_json(json_hash['provision']) unless json_hash['provision'].nil?

      result
    end
  end
end
