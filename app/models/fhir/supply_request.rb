module FHIR
  # fhir/supply_request.rb
  class SupplyRequest < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::SupplyRequestStatus'    
    embeds_one :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :priority, class_name: 'FHIR::RequestPriority'    
    embeds_one :itemCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :itemReference, class_name: 'FHIR::Reference'    
    embeds_one :quantity, class_name: 'FHIR::Quantity'    
    embeds_many :parameter, class_name: 'FHIR::SupplyRequestParameter'    
    embeds_one :occurrenceDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :occurrencePeriod, class_name: 'FHIR::Period'    
    embeds_one :occurrenceTiming, class_name: 'FHIR::Timing'    
    embeds_one :authoredOn, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :requester, class_name: 'FHIR::Reference'    
    embeds_many :supplier, class_name: 'FHIR::Reference'    
    embeds_many :reasonCode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :reasonReference, class_name: 'FHIR::Reference'    
    embeds_one :deliverFrom, class_name: 'FHIR::Reference'    
    embeds_one :deliverTo, class_name: 'FHIR::Reference'    
    
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
      unless self.category.nil? 
        result['category'] = self.category.as_json(*args)
      end
      unless self.priority.nil? 
        result['priority'] = self.priority.value
        serialized = Extension.serializePrimitiveExtension(self.priority)            
        result['_priority'] = serialized unless serialized.nil?
      end
      unless self.itemCodeableConcept.nil?
        result['itemCodeableConcept'] = self.itemCodeableConcept.as_json(*args)                        
      end          
      unless self.itemReference.nil?
        result['itemReference'] = self.itemReference.as_json(*args)                        
      end          
      unless self.quantity.nil? 
        result['quantity'] = self.quantity.as_json(*args)
      end
      unless self.parameter.nil?  || !self.parameter.any? 
        result['parameter'] = self.parameter.map{ |x| x.as_json(*args) }
      end
      unless self.occurrenceDateTime.nil?
        result['occurrenceDateTime'] = self.occurrenceDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.occurrenceDateTime) 
        result['_occurrenceDateTime'] = serialized unless serialized.nil?
      end          
      unless self.occurrencePeriod.nil?
        result['occurrencePeriod'] = self.occurrencePeriod.as_json(*args)                        
      end          
      unless self.occurrenceTiming.nil?
        result['occurrenceTiming'] = self.occurrenceTiming.as_json(*args)                        
      end          
      unless self.authoredOn.nil? 
        result['authoredOn'] = self.authoredOn.value
        serialized = Extension.serializePrimitiveExtension(self.authoredOn)            
        result['_authoredOn'] = serialized unless serialized.nil?
      end
      unless self.requester.nil? 
        result['requester'] = self.requester.as_json(*args)
      end
      unless self.supplier.nil?  || !self.supplier.any? 
        result['supplier'] = self.supplier.map{ |x| x.as_json(*args) }
      end
      unless self.reasonCode.nil?  || !self.reasonCode.any? 
        result['reasonCode'] = self.reasonCode.map{ |x| x.as_json(*args) }
      end
      unless self.reasonReference.nil?  || !self.reasonReference.any? 
        result['reasonReference'] = self.reasonReference.map{ |x| x.as_json(*args) }
      end
      unless self.deliverFrom.nil? 
        result['deliverFrom'] = self.deliverFrom.as_json(*args)
      end
      unless self.deliverTo.nil? 
        result['deliverTo'] = self.deliverTo.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SupplyRequest.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['status'] = SupplyRequestStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?
      result['priority'] = RequestPriority.transform_json(json_hash['priority'], json_hash['_priority']) unless json_hash['priority'].nil?
      result['itemCodeableConcept'] = CodeableConcept.transform_json(json_hash['itemCodeableConcept']) unless json_hash['itemCodeableConcept'].nil?
      result['itemReference'] = Reference.transform_json(json_hash['itemReference']) unless json_hash['itemReference'].nil?
      result['quantity'] = Quantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?
      result['parameter'] = json_hash['parameter'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          SupplyRequestParameter.transform_json(var) 
        end
      } unless json_hash['parameter'].nil?
      result['occurrenceDateTime'] = PrimitiveDateTime.transform_json(json_hash['occurrenceDateTime'], json_hash['_occurrenceDateTime']) unless json_hash['occurrenceDateTime'].nil?
      result['occurrencePeriod'] = Period.transform_json(json_hash['occurrencePeriod']) unless json_hash['occurrencePeriod'].nil?
      result['occurrenceTiming'] = Timing.transform_json(json_hash['occurrenceTiming']) unless json_hash['occurrenceTiming'].nil?
      result['authoredOn'] = PrimitiveDateTime.transform_json(json_hash['authoredOn'], json_hash['_authoredOn']) unless json_hash['authoredOn'].nil?
      result['requester'] = Reference.transform_json(json_hash['requester']) unless json_hash['requester'].nil?
      result['supplier'] = json_hash['supplier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['supplier'].nil?
      result['reasonCode'] = json_hash['reasonCode'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['reasonReference'].nil?
      result['deliverFrom'] = Reference.transform_json(json_hash['deliverFrom']) unless json_hash['deliverFrom'].nil?
      result['deliverTo'] = Reference.transform_json(json_hash['deliverTo']) unless json_hash['deliverTo'].nil?

      result
    end
  end
end
