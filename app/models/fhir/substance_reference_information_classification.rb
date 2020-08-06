module FHIR
  # fhir/substance_reference_information_classification.rb
  class SubstanceReferenceInformationClassification < BackboneElement
    include Mongoid::Document
    embeds_one :domain, class_name: 'FHIR::CodeableConcept'    
    embeds_one :classification, class_name: 'FHIR::CodeableConcept'    
    embeds_many :subtype, class_name: 'FHIR::CodeableConcept'    
    embeds_many :source, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.domain.nil? 
        result['domain'] = self.domain.as_json(*args)
      end
      unless self.classification.nil? 
        result['classification'] = self.classification.as_json(*args)
      end
      unless self.subtype.nil?  || !self.subtype.any? 
        result['subtype'] = self.subtype.map{ |x| x.as_json(*args) }
      end
      unless self.source.nil?  || !self.source.any? 
        result['source'] = self.source.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstanceReferenceInformationClassification.new)
      result = self.superclass.transform_json(json_hash, target)
      result['domain'] = CodeableConcept.transform_json(json_hash['domain']) unless json_hash['domain'].nil?
      result['classification'] = CodeableConcept.transform_json(json_hash['classification']) unless json_hash['classification'].nil?
      result['subtype'] = json_hash['subtype'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['subtype'].nil?
      result['source'] = json_hash['source'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['source'].nil?

      result
    end
  end
end
