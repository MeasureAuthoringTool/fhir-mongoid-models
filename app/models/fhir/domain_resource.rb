module FHIR
  # fhir/domain_resource.rb
  class DomainResource < Resource
    include Mongoid::Document
    embeds_one :text, class_name: 'FHIR::Narrative'    
    embeds_many :contained, class_name: 'FHIR::Resource'    
    embeds_many :extension, class_name: 'FHIR::Extension'    
    embeds_many :modifierExtension, class_name: 'FHIR::Extension'    
    
    def as_json(*args)
      result = super      
      unless self.text.nil? 
        result['text'] = self.text.as_json(*args)
      end
      unless self.contained.nil?  || !self.contained.any? 
        result['contained'] = self.contained.map{ |x| x.as_json(*args) }
      end
      unless self.extension.nil?  || !self.extension.any? 
        result['extension'] = self.extension.map{ |x| x.as_json(*args) }
      end
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

    def self.transform_json(json_hash, target = DomainResource.new)
      result = self.superclass.transform_json(json_hash, target)
      result['text'] = Narrative.transform_json(json_hash['text']) unless json_hash['text'].nil?
      result['contained'] = json_hash['contained'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Resource.transform_json(var) 
        end
      } unless json_hash['contained'].nil?
      result['extension'] = json_hash['extension'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Extension.transform_json(var) 
        end
      } unless json_hash['extension'].nil?
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
