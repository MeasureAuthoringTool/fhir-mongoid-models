module FHIR
  # fhir/element.rb
  class Element < Type
    include Mongoid::Document
    field :id, type: String    
    embeds_many :extension, class_name: 'FHIR::Extension'    
    field :fhirId, type: String    
    
    def as_json(*args)
      result = super      
      unless self.id.nil? 
        result['id'] = self.id
      end
      unless self.extension.nil?  || !self.extension.any? 
        result['extension'] = self.extension.map{ |x| x.as_json(*args) }
      end
      unless self.fhirId.nil? 
        result['fhirId'] = self.fhirId
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Element.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['fhirId'] = json_hash['id'] unless json_hash['id'].nil?
      result['extension'] = json_hash['extension'].map { |var| Extension.transform_json(var) } unless json_hash['extension'].nil?

      result
    end
  end
end
