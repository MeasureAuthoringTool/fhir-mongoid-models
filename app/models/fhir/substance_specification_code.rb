module FHIR
  # fhir/substance_specification_code.rb
  class SubstanceSpecificationCode < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :status, class_name: 'FHIR::CodeableConcept'    
    embeds_one :statusDate, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :comment, class_name: 'FHIR::PrimitiveString'    
    embeds_many :source, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.status.nil? 
        result['status'] = self.status.as_json(*args)
      end
      unless self.statusDate.nil? 
        result['statusDate'] = self.statusDate.value
        serialized = Extension.serializePrimitiveExtension(self.statusDate)            
        result['_statusDate'] = serialized unless serialized.nil?
      end
      unless self.comment.nil? 
        result['comment'] = self.comment.value
        serialized = Extension.serializePrimitiveExtension(self.comment)            
        result['_comment'] = serialized unless serialized.nil?
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

    def self.transform_json(json_hash, target = SubstanceSpecificationCode.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['status'] = CodeableConcept.transform_json(json_hash['status']) unless json_hash['status'].nil?
      result['statusDate'] = PrimitiveDateTime.transform_json(json_hash['statusDate'], json_hash['_statusDate']) unless json_hash['statusDate'].nil?
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?
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
