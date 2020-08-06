module FHIR
  # fhir/substance_reference_information_target.rb
  class SubstanceReferenceInformationTarget < BackboneElement
    include Mongoid::Document
    embeds_one :target, class_name: 'FHIR::Identifier'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :interaction, class_name: 'FHIR::CodeableConcept'    
    embeds_one :organism, class_name: 'FHIR::CodeableConcept'    
    embeds_one :organismType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :amountQuantity, class_name: 'FHIR::Quantity'    
    embeds_one :amountRange, class_name: 'FHIR::Range'    
    embeds_one :amountString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :amountType, class_name: 'FHIR::CodeableConcept'    
    embeds_many :source, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.target.nil? 
        result['target'] = self.target.as_json(*args)
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.interaction.nil? 
        result['interaction'] = self.interaction.as_json(*args)
      end
      unless self.organism.nil? 
        result['organism'] = self.organism.as_json(*args)
      end
      unless self.organismType.nil? 
        result['organismType'] = self.organismType.as_json(*args)
      end
      unless self.amountQuantity.nil?
        result['amountQuantity'] = self.amountQuantity.as_json(*args)                        
      end          
      unless self.amountRange.nil?
        result['amountRange'] = self.amountRange.as_json(*args)                        
      end          
      unless self.amountString.nil?
        result['amountString'] = self.amountString.value                        
        serialized = Extension.serializePrimitiveExtension(self.amountString) 
        result['_amountString'] = serialized unless serialized.nil?
      end          
      unless self.amountType.nil? 
        result['amountType'] = self.amountType.as_json(*args)
      end
      unless self.source.nil?  || !self.source.any? 
        result['source'] = self.source.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstanceReferenceInformationTarget.new)
      result = self.superclass.transform_json(json_hash, target)
      result['target'] = Identifier.transform_json(json_hash['target']) unless json_hash['target'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['interaction'] = CodeableConcept.transform_json(json_hash['interaction']) unless json_hash['interaction'].nil?
      result['organism'] = CodeableConcept.transform_json(json_hash['organism']) unless json_hash['organism'].nil?
      result['organismType'] = CodeableConcept.transform_json(json_hash['organismType']) unless json_hash['organismType'].nil?
      result['amountQuantity'] = Quantity.transform_json(json_hash['amountQuantity']) unless json_hash['amountQuantity'].nil?
      result['amountRange'] = Range.transform_json(json_hash['amountRange']) unless json_hash['amountRange'].nil?
      result['amountString'] = PrimitiveString.transform_json(json_hash['amountString'], json_hash['_amountString']) unless json_hash['amountString'].nil?
      result['amountType'] = CodeableConcept.transform_json(json_hash['amountType']) unless json_hash['amountType'].nil?
      result['source'] = json_hash['source'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['source'].nil?

      result
    end
  end
end
