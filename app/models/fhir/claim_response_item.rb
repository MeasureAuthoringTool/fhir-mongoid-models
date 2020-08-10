module FHIR
  # fhir/claim_response_item.rb
  class ClaimResponseItem < BackboneElement
    include Mongoid::Document
    embeds_one :itemSequence, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_many :noteNumber, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_many :adjudication, class_name: 'FHIR::ClaimResponseItemAdjudication'    
    embeds_many :detail, class_name: 'FHIR::ClaimResponseItemDetail'    
    
    def as_json(*args)
      result = super      
      unless self.itemSequence.nil? 
        result['itemSequence'] = self.itemSequence.value
        serialized = Extension.serializePrimitiveExtension(self.itemSequence)            
        result['_itemSequence'] = serialized unless serialized.nil?
      end
      unless self.noteNumber.nil?  || !self.noteNumber.any? 
        result['noteNumber'] = self.noteNumber.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.noteNumber)                              
        result['_noteNumber'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.adjudication.nil?  || !self.adjudication.any? 
        result['adjudication'] = self.adjudication.map{ |x| x.as_json(*args) }
      end
      unless self.detail.nil?  || !self.detail.any? 
        result['detail'] = self.detail.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ClaimResponseItem.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['itemSequence'] = PrimitivePositiveInt.transform_json(json_hash['itemSequence'], json_hash['_itemSequence']) unless json_hash['itemSequence'].nil?
      result['noteNumber'] = json_hash['noteNumber'].each_with_index.map do |var, i|
        extension_hash = json_hash['_noteNumber'] && json_hash['_noteNumber'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['noteNumber'].nil?
      result['adjudication'] = json_hash['adjudication'].map { |var| ClaimResponseItemAdjudication.transform_json(var) } unless json_hash['adjudication'].nil?
      result['detail'] = json_hash['detail'].map { |var| ClaimResponseItemDetail.transform_json(var) } unless json_hash['detail'].nil?

      result
    end
  end
end
