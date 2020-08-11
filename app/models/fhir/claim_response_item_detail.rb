module FHIR
  # fhir/claim_response_item_detail.rb
  class ClaimResponseItemDetail < BackboneElement
    include Mongoid::Document
    embeds_one :detailSequence, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_many :noteNumber, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_many :adjudication, class_name: 'FHIR::ClaimResponseItemAdjudication'    
    embeds_many :subDetail, class_name: 'FHIR::ClaimResponseItemDetailSubDetail'    
    
    def as_json(*args)
      result = super      
      unless self.detailSequence.nil? 
        result['detailSequence'] = self.detailSequence.value
        serialized = Extension.serializePrimitiveExtension(self.detailSequence)            
        result['_detailSequence'] = serialized unless serialized.nil?
      end
      unless self.noteNumber.nil?  || !self.noteNumber.any? 
        result['noteNumber'] = self.noteNumber.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.noteNumber)                              
        result['_noteNumber'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.adjudication.nil?  || !self.adjudication.any? 
        result['adjudication'] = self.adjudication.map{ |x| x.as_json(*args) }
      end
      unless self.subDetail.nil?  || !self.subDetail.any? 
        result['subDetail'] = self.subDetail.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ClaimResponseItemDetail.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['detailSequence'] = PrimitivePositiveInt.transform_json(json_hash['detailSequence'], json_hash['_detailSequence']) unless json_hash['detailSequence'].nil?
      result['noteNumber'] = json_hash['noteNumber'].each_with_index.map do |var, i|
        extension_hash = json_hash['_noteNumber'] && json_hash['_noteNumber'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['noteNumber'].nil?
      result['adjudication'] = json_hash['adjudication'].map { |var| ClaimResponseItemAdjudication.transform_json(var) } unless json_hash['adjudication'].nil?
      result['subDetail'] = json_hash['subDetail'].map { |var| ClaimResponseItemDetailSubDetail.transform_json(var) } unless json_hash['subDetail'].nil?

      result
    end
  end
end
