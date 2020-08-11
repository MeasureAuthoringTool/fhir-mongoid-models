module FHIR
  # fhir/vision_prescription.rb
  class VisionPrescription < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::VisionStatus'    
    embeds_one :created, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :patient, class_name: 'FHIR::Reference'    
    embeds_one :encounter, class_name: 'FHIR::Reference'    
    embeds_one :dateWritten, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :prescriber, class_name: 'FHIR::Reference'    
    embeds_many :lensSpecification, class_name: 'FHIR::VisionPrescriptionLensSpecification'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.created.nil? 
        result['created'] = self.created.value
        serialized = Extension.serializePrimitiveExtension(self.created)            
        result['_created'] = serialized unless serialized.nil?
      end
      unless self.patient.nil? 
        result['patient'] = self.patient.as_json(*args)
      end
      unless self.encounter.nil? 
        result['encounter'] = self.encounter.as_json(*args)
      end
      unless self.dateWritten.nil? 
        result['dateWritten'] = self.dateWritten.value
        serialized = Extension.serializePrimitiveExtension(self.dateWritten)            
        result['_dateWritten'] = serialized unless serialized.nil?
      end
      unless self.prescriber.nil? 
        result['prescriber'] = self.prescriber.as_json(*args)
      end
      unless self.lensSpecification.nil?  || !self.lensSpecification.any? 
        result['lensSpecification'] = self.lensSpecification.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = VisionPrescription.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = VisionStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['created'] = PrimitiveDateTime.transform_json(json_hash['created'], json_hash['_created']) unless json_hash['created'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?
      result['dateWritten'] = PrimitiveDateTime.transform_json(json_hash['dateWritten'], json_hash['_dateWritten']) unless json_hash['dateWritten'].nil?
      result['prescriber'] = Reference.transform_json(json_hash['prescriber']) unless json_hash['prescriber'].nil?
      result['lensSpecification'] = json_hash['lensSpecification'].map { |var| VisionPrescriptionLensSpecification.transform_json(var) } unless json_hash['lensSpecification'].nil?

      result
    end
  end
end
