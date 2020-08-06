module FHIR
  # fhir/medicinal_product.rb
  class MedicinalProduct < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :domain, class_name: 'FHIR::Coding'    
    embeds_one :combinedPharmaceuticalDoseForm, class_name: 'FHIR::CodeableConcept'    
    embeds_one :legalStatusOfSupply, class_name: 'FHIR::CodeableConcept'    
    embeds_one :additionalMonitoringIndicator, class_name: 'FHIR::CodeableConcept'    
    embeds_many :specialMeasures, class_name: 'FHIR::PrimitiveString'    
    embeds_one :paediatricUseIndicator, class_name: 'FHIR::CodeableConcept'    
    embeds_many :productClassification, class_name: 'FHIR::CodeableConcept'    
    embeds_many :marketingStatus, class_name: 'FHIR::MarketingStatus'    
    embeds_many :pharmaceuticalProduct, class_name: 'FHIR::Reference'    
    embeds_many :packagedMedicinalProduct, class_name: 'FHIR::Reference'    
    embeds_many :attachedDocument, class_name: 'FHIR::Reference'    
    embeds_many :masterFile, class_name: 'FHIR::Reference'    
    embeds_many :contact, class_name: 'FHIR::Reference'    
    embeds_many :clinicalTrial, class_name: 'FHIR::Reference'    
    embeds_many :name, class_name: 'FHIR::MedicinalProductName'    
    embeds_many :crossReference, class_name: 'FHIR::Identifier'    
    embeds_many :manufacturingBusinessOperation, class_name: 'FHIR::MedicinalProductManufacturingBusinessOperation'    
    embeds_many :specialDesignation, class_name: 'FHIR::MedicinalProductSpecialDesignation'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.domain.nil? 
        result['domain'] = self.domain.as_json(*args)
      end
      unless self.combinedPharmaceuticalDoseForm.nil? 
        result['combinedPharmaceuticalDoseForm'] = self.combinedPharmaceuticalDoseForm.as_json(*args)
      end
      unless self.legalStatusOfSupply.nil? 
        result['legalStatusOfSupply'] = self.legalStatusOfSupply.as_json(*args)
      end
      unless self.additionalMonitoringIndicator.nil? 
        result['additionalMonitoringIndicator'] = self.additionalMonitoringIndicator.as_json(*args)
      end
      unless self.specialMeasures.nil?  || !self.specialMeasures.any? 
        result['specialMeasures'] = self.specialMeasures.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.specialMeasures)                              
        result['_specialMeasures'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.paediatricUseIndicator.nil? 
        result['paediatricUseIndicator'] = self.paediatricUseIndicator.as_json(*args)
      end
      unless self.productClassification.nil?  || !self.productClassification.any? 
        result['productClassification'] = self.productClassification.map{ |x| x.as_json(*args) }
      end
      unless self.marketingStatus.nil?  || !self.marketingStatus.any? 
        result['marketingStatus'] = self.marketingStatus.map{ |x| x.as_json(*args) }
      end
      unless self.pharmaceuticalProduct.nil?  || !self.pharmaceuticalProduct.any? 
        result['pharmaceuticalProduct'] = self.pharmaceuticalProduct.map{ |x| x.as_json(*args) }
      end
      unless self.packagedMedicinalProduct.nil?  || !self.packagedMedicinalProduct.any? 
        result['packagedMedicinalProduct'] = self.packagedMedicinalProduct.map{ |x| x.as_json(*args) }
      end
      unless self.attachedDocument.nil?  || !self.attachedDocument.any? 
        result['attachedDocument'] = self.attachedDocument.map{ |x| x.as_json(*args) }
      end
      unless self.masterFile.nil?  || !self.masterFile.any? 
        result['masterFile'] = self.masterFile.map{ |x| x.as_json(*args) }
      end
      unless self.contact.nil?  || !self.contact.any? 
        result['contact'] = self.contact.map{ |x| x.as_json(*args) }
      end
      unless self.clinicalTrial.nil?  || !self.clinicalTrial.any? 
        result['clinicalTrial'] = self.clinicalTrial.map{ |x| x.as_json(*args) }
      end
      unless self.name.nil?  || !self.name.any? 
        result['name'] = self.name.map{ |x| x.as_json(*args) }
      end
      unless self.crossReference.nil?  || !self.crossReference.any? 
        result['crossReference'] = self.crossReference.map{ |x| x.as_json(*args) }
      end
      unless self.manufacturingBusinessOperation.nil?  || !self.manufacturingBusinessOperation.any? 
        result['manufacturingBusinessOperation'] = self.manufacturingBusinessOperation.map{ |x| x.as_json(*args) }
      end
      unless self.specialDesignation.nil?  || !self.specialDesignation.any? 
        result['specialDesignation'] = self.specialDesignation.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicinalProduct.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['domain'] = Coding.transform_json(json_hash['domain']) unless json_hash['domain'].nil?
      result['combinedPharmaceuticalDoseForm'] = CodeableConcept.transform_json(json_hash['combinedPharmaceuticalDoseForm']) unless json_hash['combinedPharmaceuticalDoseForm'].nil?
      result['legalStatusOfSupply'] = CodeableConcept.transform_json(json_hash['legalStatusOfSupply']) unless json_hash['legalStatusOfSupply'].nil?
      result['additionalMonitoringIndicator'] = CodeableConcept.transform_json(json_hash['additionalMonitoringIndicator']) unless json_hash['additionalMonitoringIndicator'].nil?
      result['specialMeasures'] = json_hash['specialMeasures'].each_with_index.map do |var, i|
        extension_hash = json_hash['_specialMeasures'] && json_hash['_specialMeasures'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['specialMeasures'].nil?
      result['paediatricUseIndicator'] = CodeableConcept.transform_json(json_hash['paediatricUseIndicator']) unless json_hash['paediatricUseIndicator'].nil?
      result['productClassification'] = json_hash['productClassification'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['productClassification'].nil?
      result['marketingStatus'] = json_hash['marketingStatus'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          MarketingStatus.transform_json(var) 
        end
      } unless json_hash['marketingStatus'].nil?
      result['pharmaceuticalProduct'] = json_hash['pharmaceuticalProduct'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['pharmaceuticalProduct'].nil?
      result['packagedMedicinalProduct'] = json_hash['packagedMedicinalProduct'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['packagedMedicinalProduct'].nil?
      result['attachedDocument'] = json_hash['attachedDocument'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['attachedDocument'].nil?
      result['masterFile'] = json_hash['masterFile'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['masterFile'].nil?
      result['contact'] = json_hash['contact'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['contact'].nil?
      result['clinicalTrial'] = json_hash['clinicalTrial'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['clinicalTrial'].nil?
      result['name'] = json_hash['name'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          MedicinalProductName.transform_json(var) 
        end
      } unless json_hash['name'].nil?
      result['crossReference'] = json_hash['crossReference'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['crossReference'].nil?
      result['manufacturingBusinessOperation'] = json_hash['manufacturingBusinessOperation'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          MedicinalProductManufacturingBusinessOperation.transform_json(var) 
        end
      } unless json_hash['manufacturingBusinessOperation'].nil?
      result['specialDesignation'] = json_hash['specialDesignation'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          MedicinalProductSpecialDesignation.transform_json(var) 
        end
      } unless json_hash['specialDesignation'].nil?

      result
    end
  end
end
