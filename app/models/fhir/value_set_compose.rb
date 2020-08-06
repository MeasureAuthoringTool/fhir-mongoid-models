module FHIR
  # fhir/value_set_compose.rb
  class ValueSetCompose < BackboneElement
    include Mongoid::Document
    embeds_one :lockedDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :inactive, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_many :include, class_name: 'FHIR::ValueSetComposeInclude'    
    embeds_many :exclude, class_name: 'FHIR::ValueSetComposeInclude'    
    
    def as_json(*args)
      result = super      
      unless self.lockedDate.nil? 
        result['lockedDate'] = self.lockedDate.value
        serialized = Extension.serializePrimitiveExtension(self.lockedDate)            
        result['_lockedDate'] = serialized unless serialized.nil?
      end
      unless self.inactive.nil? 
        result['inactive'] = self.inactive.value
        serialized = Extension.serializePrimitiveExtension(self.inactive)            
        result['_inactive'] = serialized unless serialized.nil?
      end
      unless self.include.nil?  || !self.include.any? 
        result['include'] = self.include.map{ |x| x.as_json(*args) }
      end
      unless self.exclude.nil?  || !self.exclude.any? 
        result['exclude'] = self.exclude.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ValueSetCompose.new)
      result = self.superclass.transform_json(json_hash, target)
      result['lockedDate'] = PrimitiveDate.transform_json(json_hash['lockedDate'], json_hash['_lockedDate']) unless json_hash['lockedDate'].nil?
      result['inactive'] = PrimitiveBoolean.transform_json(json_hash['inactive'], json_hash['_inactive']) unless json_hash['inactive'].nil?
      result['include'] = json_hash['include'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ValueSetComposeInclude.transform_json(var) 
        end
      } unless json_hash['include'].nil?
      result['exclude'] = json_hash['exclude'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ValueSetComposeInclude.transform_json(var) 
        end
      } unless json_hash['exclude'].nil?

      result
    end
  end
end
