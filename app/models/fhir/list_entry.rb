module FHIR
  # fhir/list_entry.rb
  class ListEntry < BackboneElement
    include Mongoid::Document
    embeds_one :flag, class_name: 'FHIR::CodeableConcept'    
    embeds_one :deleted, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :item, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.flag.nil? 
        result['flag'] = self.flag.as_json(*args)
      end
      unless self.deleted.nil? 
        result['deleted'] = self.deleted.value
        serialized = Extension.serializePrimitiveExtension(self.deleted)            
        result['_deleted'] = serialized unless serialized.nil?
      end
      unless self.date.nil? 
        result['date'] = self.date.value
        serialized = Extension.serializePrimitiveExtension(self.date)            
        result['_date'] = serialized unless serialized.nil?
      end
      unless self.item.nil? 
        result['item'] = self.item.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ListEntry.new)
      result = self.superclass.transform_json(json_hash, target)
      result['flag'] = CodeableConcept.transform_json(json_hash['flag']) unless json_hash['flag'].nil?
      result['deleted'] = PrimitiveBoolean.transform_json(json_hash['deleted'], json_hash['_deleted']) unless json_hash['deleted'].nil?
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?
      result['item'] = Reference.transform_json(json_hash['item']) unless json_hash['item'].nil?

      result
    end
  end
end
