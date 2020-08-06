module FHIR
  # fhir/backbone_element.rb
  class BackboneElement < Element
    include Mongoid::Document
    embeds_many :modifierExtension, class_name: 'FHIR::Extension'    
    
    def as_json(*args)
      result = super      
      unless self.modifierExtension.nil?  || !self.modifierExtension.any? 
        result['modifierExtension'] = self.modifierExtension.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = BackboneElement.new)
      result = self.superclass.transform_json(json_hash, target)
      result['modifierExtension'] = json_hash['modifierExtension'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Extension.transform_json(var) 
        end
      } unless json_hash['modifierExtension'].nil?

      result
    end
  end
end
