module FHIR
  # fhir/bundle.rb
  class Bundle < Resource
    include Mongoid::Document
    embeds_one :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :type, class_name: 'FHIR::BundleType'    
    embeds_one :timestamp, class_name: 'FHIR::PrimitiveInstant'    
    embeds_one :total, class_name: 'FHIR::PrimitiveUnsignedInt'    
    embeds_many :link, class_name: 'FHIR::BundleLink'    
    embeds_many :entry, class_name: 'FHIR::BundleEntry'    
    embeds_one :signature, class_name: 'FHIR::Signature'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil? 
        result['identifier'] = self.identifier.as_json(*args)
      end
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
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
      unless self.link.nil?  || !self.link.any? 
        result['link'] = self.link.map{ |x| x.as_json(*args) }
      end
      unless self.entry.nil?  || !self.entry.any? 
        result['entry'] = self.entry.map{ |x| x.as_json(*args) }
      end
      unless self.signature.nil? 
        result['signature'] = self.signature.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Bundle.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?
      result['type'] = BundleType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['timestamp'] = PrimitiveInstant.transform_json(json_hash['timestamp'], json_hash['_timestamp']) unless json_hash['timestamp'].nil?
      result['total'] = PrimitiveUnsignedInt.transform_json(json_hash['total'], json_hash['_total']) unless json_hash['total'].nil?
      result['link'] = json_hash['link'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          BundleLink.transform_json(var) 
        end
      } unless json_hash['link'].nil?
      result['entry'] = json_hash['entry'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          BundleEntry.transform_json(var) 
        end
      } unless json_hash['entry'].nil?
      result['signature'] = Signature.transform_json(json_hash['signature']) unless json_hash['signature'].nil?

      result
    end
  end
end
