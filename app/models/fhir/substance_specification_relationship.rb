module FHIR
  # fhir/substance_specification_relationship.rb
  class SubstanceSpecificationRelationship < BackboneElement
    include Mongoid::Document
    embeds_one :substanceReference, class_name: 'FHIR::Reference'    
    embeds_one :substanceCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :relationship, class_name: 'FHIR::CodeableConcept'    
    embeds_one :isDefining, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :amountQuantity, class_name: 'FHIR::Quantity'    
    embeds_one :amountRange, class_name: 'FHIR::Range'    
    embeds_one :amountRatio, class_name: 'FHIR::Ratio'    
    embeds_one :amountString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :amountRatioLowLimit, class_name: 'FHIR::Ratio'    
    embeds_one :amountType, class_name: 'FHIR::CodeableConcept'    
    embeds_many :source, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.substanceReference.nil?
        result['substanceReference'] = self.substanceReference.as_json(*args)                        
      end          
      unless self.substanceCodeableConcept.nil?
        result['substanceCodeableConcept'] = self.substanceCodeableConcept.as_json(*args)                        
      end          
      unless self.relationship.nil? 
        result['relationship'] = self.relationship.as_json(*args)
      end
      unless self.isDefining.nil? 
        result['isDefining'] = self.isDefining.value
        serialized = Extension.serializePrimitiveExtension(self.isDefining)            
        result['_isDefining'] = serialized unless serialized.nil?
      end
      unless self.amountQuantity.nil?
        result['amountQuantity'] = self.amountQuantity.as_json(*args)                        
      end          
      unless self.amountRange.nil?
        result['amountRange'] = self.amountRange.as_json(*args)                        
      end          
      unless self.amountRatio.nil?
        result['amountRatio'] = self.amountRatio.as_json(*args)                        
      end          
      unless self.amountString.nil?
        result['amountString'] = self.amountString.value                        
        serialized = Extension.serializePrimitiveExtension(self.amountString) 
        result['_amountString'] = serialized unless serialized.nil?
      end          
      unless self.amountRatioLowLimit.nil? 
        result['amountRatioLowLimit'] = self.amountRatioLowLimit.as_json(*args)
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

    def self.transform_json(json_hash, target = SubstanceSpecificationRelationship.new)
      result = self.superclass.transform_json(json_hash, target)
      result['substanceReference'] = Reference.transform_json(json_hash['substanceReference']) unless json_hash['substanceReference'].nil?
      result['substanceCodeableConcept'] = CodeableConcept.transform_json(json_hash['substanceCodeableConcept']) unless json_hash['substanceCodeableConcept'].nil?
      result['relationship'] = CodeableConcept.transform_json(json_hash['relationship']) unless json_hash['relationship'].nil?
      result['isDefining'] = PrimitiveBoolean.transform_json(json_hash['isDefining'], json_hash['_isDefining']) unless json_hash['isDefining'].nil?
      result['amountQuantity'] = Quantity.transform_json(json_hash['amountQuantity']) unless json_hash['amountQuantity'].nil?
      result['amountRange'] = Range.transform_json(json_hash['amountRange']) unless json_hash['amountRange'].nil?
      result['amountRatio'] = Ratio.transform_json(json_hash['amountRatio']) unless json_hash['amountRatio'].nil?
      result['amountString'] = PrimitiveString.transform_json(json_hash['amountString'], json_hash['_amountString']) unless json_hash['amountString'].nil?
      result['amountRatioLowLimit'] = Ratio.transform_json(json_hash['amountRatioLowLimit']) unless json_hash['amountRatioLowLimit'].nil?
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
