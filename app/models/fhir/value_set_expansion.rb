module FHIR
  # fhir/value_set_expansion.rb
  class ValueSetExpansion < BackboneElement
    include Mongoid::Document
    embeds_one :identifier, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :timestamp, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :total, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :offset, class_name: 'FHIR::PrimitiveInteger'    
    embeds_many :parameter, class_name: 'FHIR::ValueSetExpansionParameter'    
    embeds_many :contains, class_name: 'FHIR::ValueSetExpansionContains'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil? 
        result['identifier'] = self.identifier.value
        serialized = Extension.serializePrimitiveExtension(self.identifier)            
        result['_identifier'] = serialized unless serialized.nil?
      end
      unless self.timestamp.nil? 
        result['timestamp'] = self.timestamp.value
        serialized = Extension.serializePrimitiveExtension(self.timestamp)            
        result['_timestamp'] = serialized unless serialized.nil?
      end
      unless self.total.nil? 
        result['total'] = self.total.value
        serialized = Extension.serializePrimitiveExtension(self.total)            
        result['_total'] = serialized unless serialized.nil?
      end
      unless self.offset.nil? 
        result['offset'] = self.offset.value
        serialized = Extension.serializePrimitiveExtension(self.offset)            
        result['_offset'] = serialized unless serialized.nil?
      end
      unless self.parameter.nil?  || !self.parameter.any? 
        result['parameter'] = self.parameter.map{ |x| x.as_json(*args) }
      end
      unless self.contains.nil?  || !self.contains.any? 
        result['contains'] = self.contains.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ValueSetExpansion.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = PrimitiveUri.transform_json(json_hash['identifier'], json_hash['_identifier']) unless json_hash['identifier'].nil?
      result['timestamp'] = PrimitiveDateTime.transform_json(json_hash['timestamp'], json_hash['_timestamp']) unless json_hash['timestamp'].nil?
      result['total'] = PrimitiveInteger.transform_json(json_hash['total'], json_hash['_total']) unless json_hash['total'].nil?
      result['offset'] = PrimitiveInteger.transform_json(json_hash['offset'], json_hash['_offset']) unless json_hash['offset'].nil?
      result['parameter'] = json_hash['parameter'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ValueSetExpansionParameter.transform_json(var) 
        end
      } unless json_hash['parameter'].nil?
      result['contains'] = json_hash['contains'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ValueSetExpansionContains.transform_json(var) 
        end
      } unless json_hash['contains'].nil?

      result
    end
  end
end
