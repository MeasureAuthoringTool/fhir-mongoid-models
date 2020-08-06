module FHIR
  # fhir/medicinal_product_packaged.rb
  class MedicinalProductPackaged < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_many :subject, class_name: 'FHIR::Reference'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :legalStatusOfSupply, class_name: 'FHIR::CodeableConcept'    
    embeds_many :marketingStatus, class_name: 'FHIR::MarketingStatus'    
    embeds_one :marketingAuthorization, class_name: 'FHIR::Reference'    
    embeds_many :manufacturer, class_name: 'FHIR::Reference'    
    embeds_many :batchIdentifier, class_name: 'FHIR::MedicinalProductPackagedBatchIdentifier'    
    embeds_many :packageItem, class_name: 'FHIR::MedicinalProductPackagedPackageItem'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.subject.nil?  || !self.subject.any? 
        result['subject'] = self.subject.map{ |x| x.as_json(*args) }
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.legalStatusOfSupply.nil? 
        result['legalStatusOfSupply'] = self.legalStatusOfSupply.as_json(*args)
      end
      unless self.marketingStatus.nil?  || !self.marketingStatus.any? 
        result['marketingStatus'] = self.marketingStatus.map{ |x| x.as_json(*args) }
      end
      unless self.marketingAuthorization.nil? 
        result['marketingAuthorization'] = self.marketingAuthorization.as_json(*args)
      end
      unless self.manufacturer.nil?  || !self.manufacturer.any? 
        result['manufacturer'] = self.manufacturer.map{ |x| x.as_json(*args) }
      end
      unless self.batchIdentifier.nil?  || !self.batchIdentifier.any? 
        result['batchIdentifier'] = self.batchIdentifier.map{ |x| x.as_json(*args) }
      end
      unless self.packageItem.nil?  || !self.packageItem.any? 
        result['packageItem'] = self.packageItem.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicinalProductPackaged.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['subject'] = json_hash['subject'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['subject'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['legalStatusOfSupply'] = CodeableConcept.transform_json(json_hash['legalStatusOfSupply']) unless json_hash['legalStatusOfSupply'].nil?
      result['marketingStatus'] = json_hash['marketingStatus'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          MarketingStatus.transform_json(var) 
        end
      } unless json_hash['marketingStatus'].nil?
      result['marketingAuthorization'] = Reference.transform_json(json_hash['marketingAuthorization']) unless json_hash['marketingAuthorization'].nil?
      result['manufacturer'] = json_hash['manufacturer'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['manufacturer'].nil?
      result['batchIdentifier'] = json_hash['batchIdentifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          MedicinalProductPackagedBatchIdentifier.transform_json(var) 
        end
      } unless json_hash['batchIdentifier'].nil?
      result['packageItem'] = json_hash['packageItem'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          MedicinalProductPackagedPackageItem.transform_json(var) 
        end
      } unless json_hash['packageItem'].nil?

      result
    end
  end
end
