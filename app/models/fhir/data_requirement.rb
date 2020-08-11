module FHIR
  # fhir/data_requirement.rb
  class DataRequirement < Element
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::FHIRAllTypes'    
    embeds_many :profile, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :subjectCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subjectReference, class_name: 'FHIR::Reference'    
    embeds_many :mustSupport, class_name: 'FHIR::PrimitiveString'    
    embeds_many :codeFilter, class_name: 'FHIR::DataRequirementCodeFilter'    
    embeds_many :dateFilter, class_name: 'FHIR::DataRequirementDateFilter'    
    embeds_one :limit, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_many :sort, class_name: 'FHIR::DataRequirementSort'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.profile.nil?  || !self.profile.any? 
        result['profile'] = self.profile.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.profile)                              
        result['_profile'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.subjectCodeableConcept.nil?
        result['subjectCodeableConcept'] = self.subjectCodeableConcept.as_json(*args)                        
      end          
      unless self.subjectReference.nil?
        result['subjectReference'] = self.subjectReference.as_json(*args)                        
      end          
      unless self.mustSupport.nil?  || !self.mustSupport.any? 
        result['mustSupport'] = self.mustSupport.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.mustSupport)                              
        result['_mustSupport'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.codeFilter.nil?  || !self.codeFilter.any? 
        result['codeFilter'] = self.codeFilter.map{ |x| x.as_json(*args) }
      end
      unless self.dateFilter.nil?  || !self.dateFilter.any? 
        result['dateFilter'] = self.dateFilter.map{ |x| x.as_json(*args) }
      end
      unless self.limit.nil? 
        result['limit'] = self.limit.value
        serialized = Extension.serializePrimitiveExtension(self.limit)            
        result['_limit'] = serialized unless serialized.nil?
      end
      unless self.sort.nil?  || !self.sort.any? 
        result['sort'] = self.sort.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = DataRequirement.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = FHIRAllTypes.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['profile'] = json_hash['profile'].each_with_index.map do |var, i|
        extension_hash = json_hash['_profile'] && json_hash['_profile'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['profile'].nil?
      result['subjectCodeableConcept'] = CodeableConcept.transform_json(json_hash['subjectCodeableConcept']) unless json_hash['subjectCodeableConcept'].nil?
      result['subjectReference'] = Reference.transform_json(json_hash['subjectReference']) unless json_hash['subjectReference'].nil?
      result['mustSupport'] = json_hash['mustSupport'].each_with_index.map do |var, i|
        extension_hash = json_hash['_mustSupport'] && json_hash['_mustSupport'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['mustSupport'].nil?
      result['codeFilter'] = json_hash['codeFilter'].map { |var| DataRequirementCodeFilter.transform_json(var) } unless json_hash['codeFilter'].nil?
      result['dateFilter'] = json_hash['dateFilter'].map { |var| DataRequirementDateFilter.transform_json(var) } unless json_hash['dateFilter'].nil?
      result['limit'] = PrimitivePositiveInt.transform_json(json_hash['limit'], json_hash['_limit']) unless json_hash['limit'].nil?
      result['sort'] = json_hash['sort'].map { |var| DataRequirementSort.transform_json(var) } unless json_hash['sort'].nil?

      result
    end
  end
end
