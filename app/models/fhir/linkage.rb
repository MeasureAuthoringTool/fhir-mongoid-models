module FHIR
  # fhir/linkage.rb
  class Linkage < DomainResource
    include Mongoid::Document
    embeds_one :active, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :author, class_name: 'FHIR::Reference'    
    embeds_many :item, class_name: 'FHIR::LinkageItem'    
    
    def as_json(*args)
      result = super      
      unless self.active.nil? 
        result['active'] = self.active.value
        serialized = Extension.serializePrimitiveExtension(self.active)            
        result['_active'] = serialized unless serialized.nil?
      end
      unless self.author.nil? 
        result['author'] = self.author.as_json(*args)
      end
      unless self.item.nil?  || !self.item.any? 
        result['item'] = self.item.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Linkage.new)
      result = self.superclass.transform_json(json_hash, target)
      result['active'] = PrimitiveBoolean.transform_json(json_hash['active'], json_hash['_active']) unless json_hash['active'].nil?
      result['author'] = Reference.transform_json(json_hash['author']) unless json_hash['author'].nil?
      result['item'] = json_hash['item'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          LinkageItem.transform_json(var) 
        end
      } unless json_hash['item'].nil?

      result
    end
  end
end
