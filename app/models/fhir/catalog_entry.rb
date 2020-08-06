module FHIR
  # fhir/catalog_entry.rb
  class CatalogEntry < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :orderable, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :referencedItem, class_name: 'FHIR::Reference'    
    embeds_many :additionalIdentifier, class_name: 'FHIR::Identifier'    
    embeds_many :classification, class_name: 'FHIR::CodeableConcept'    
    embeds_one :status, class_name: 'FHIR::PublicationStatus'    
    embeds_one :validityPeriod, class_name: 'FHIR::Period'    
    embeds_one :validTo, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :lastUpdated, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_many :additionalCharacteristic, class_name: 'FHIR::CodeableConcept'    
    embeds_many :additionalClassification, class_name: 'FHIR::CodeableConcept'    
    embeds_many :relatedEntry, class_name: 'FHIR::CatalogEntryRelatedEntry'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.orderable.nil? 
        result['orderable'] = self.orderable.value
        serialized = Extension.serializePrimitiveExtension(self.orderable)            
        result['_orderable'] = serialized unless serialized.nil?
      end
      unless self.referencedItem.nil? 
        result['referencedItem'] = self.referencedItem.as_json(*args)
      end
      unless self.additionalIdentifier.nil?  || !self.additionalIdentifier.any? 
        result['additionalIdentifier'] = self.additionalIdentifier.map{ |x| x.as_json(*args) }
      end
      unless self.classification.nil?  || !self.classification.any? 
        result['classification'] = self.classification.map{ |x| x.as_json(*args) }
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.validityPeriod.nil? 
        result['validityPeriod'] = self.validityPeriod.as_json(*args)
      end
      unless self.validTo.nil? 
        result['validTo'] = self.validTo.value
        serialized = Extension.serializePrimitiveExtension(self.validTo)            
        result['_validTo'] = serialized unless serialized.nil?
      end
      unless self.lastUpdated.nil? 
        result['lastUpdated'] = self.lastUpdated.value
        serialized = Extension.serializePrimitiveExtension(self.lastUpdated)            
        result['_lastUpdated'] = serialized unless serialized.nil?
      end
      unless self.additionalCharacteristic.nil?  || !self.additionalCharacteristic.any? 
        result['additionalCharacteristic'] = self.additionalCharacteristic.map{ |x| x.as_json(*args) }
      end
      unless self.additionalClassification.nil?  || !self.additionalClassification.any? 
        result['additionalClassification'] = self.additionalClassification.map{ |x| x.as_json(*args) }
      end
      unless self.relatedEntry.nil?  || !self.relatedEntry.any? 
        result['relatedEntry'] = self.relatedEntry.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CatalogEntry.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['orderable'] = PrimitiveBoolean.transform_json(json_hash['orderable'], json_hash['_orderable']) unless json_hash['orderable'].nil?
      result['referencedItem'] = Reference.transform_json(json_hash['referencedItem']) unless json_hash['referencedItem'].nil?
      result['additionalIdentifier'] = json_hash['additionalIdentifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['additionalIdentifier'].nil?
      result['classification'] = json_hash['classification'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['classification'].nil?
      result['status'] = PublicationStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['validityPeriod'] = Period.transform_json(json_hash['validityPeriod']) unless json_hash['validityPeriod'].nil?
      result['validTo'] = PrimitiveDateTime.transform_json(json_hash['validTo'], json_hash['_validTo']) unless json_hash['validTo'].nil?
      result['lastUpdated'] = PrimitiveDateTime.transform_json(json_hash['lastUpdated'], json_hash['_lastUpdated']) unless json_hash['lastUpdated'].nil?
      result['additionalCharacteristic'] = json_hash['additionalCharacteristic'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['additionalCharacteristic'].nil?
      result['additionalClassification'] = json_hash['additionalClassification'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['additionalClassification'].nil?
      result['relatedEntry'] = json_hash['relatedEntry'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CatalogEntryRelatedEntry.transform_json(var) 
        end
      } unless json_hash['relatedEntry'].nil?

      result
    end
  end
end
