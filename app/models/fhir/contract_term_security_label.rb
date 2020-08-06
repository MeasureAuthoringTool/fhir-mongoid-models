module FHIR
  # fhir/contract_term_security_label.rb
  class ContractTermSecurityLabel < BackboneElement
    include Mongoid::Document
    embeds_many :number, class_name: 'FHIR::PrimitiveUnsignedInt'    
    embeds_one :classification, class_name: 'FHIR::Coding'    
    embeds_many :category, class_name: 'FHIR::Coding'    
    embeds_many :control, class_name: 'FHIR::Coding'    
    
    def as_json(*args)
      result = super      
      unless self.number.nil?  || !self.number.any? 
        result['number'] = self.number.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.number)                              
        result['_number'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.classification.nil? 
        result['classification'] = self.classification.as_json(*args)
      end
      unless self.category.nil?  || !self.category.any? 
        result['category'] = self.category.map{ |x| x.as_json(*args) }
      end
      unless self.control.nil?  || !self.control.any? 
        result['control'] = self.control.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ContractTermSecurityLabel.new)
      result = self.superclass.transform_json(json_hash, target)
      result['number'] = json_hash['number'].each_with_index.map do |var, i|
        extension_hash = json_hash['_number'] && json_hash['_number'][i]
        PrimitiveUnsignedInt.transform_json(var, extension_hash)
      end unless json_hash['number'].nil?
      result['classification'] = Coding.transform_json(json_hash['classification']) unless json_hash['classification'].nil?
      result['category'] = json_hash['category'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Coding.transform_json(var) 
        end
      } unless json_hash['category'].nil?
      result['control'] = json_hash['control'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Coding.transform_json(var) 
        end
      } unless json_hash['control'].nil?

      result
    end
  end
end
