module FHIR
  # fhir/substance_polymer_repeat_repeat_unit.rb
  class SubstancePolymerRepeatRepeatUnit < BackboneElement
    include Mongoid::Document
    embeds_one :orientationOfPolymerisation, class_name: 'FHIR::CodeableConcept'    
    embeds_one :repeatUnit, class_name: 'FHIR::PrimitiveString'    
    embeds_one :amount, class_name: 'FHIR::SubstanceAmount'    
    embeds_many :degreeOfPolymerisation, class_name: 'FHIR::SubstancePolymerRepeatRepeatUnitDegreeOfPolymerisation'    
    embeds_many :structuralRepresentation, class_name: 'FHIR::SubstancePolymerRepeatRepeatUnitStructuralRepresentation'    
    
    def as_json(*args)
      result = super      
      unless self.orientationOfPolymerisation.nil? 
        result['orientationOfPolymerisation'] = self.orientationOfPolymerisation.as_json(*args)
      end
      unless self.repeatUnit.nil? 
        result['repeatUnit'] = self.repeatUnit.value
        serialized = Extension.serializePrimitiveExtension(self.repeatUnit)            
        result['_repeatUnit'] = serialized unless serialized.nil?
      end
      unless self.amount.nil? 
        result['amount'] = self.amount.as_json(*args)
      end
      unless self.degreeOfPolymerisation.nil?  || !self.degreeOfPolymerisation.any? 
        result['degreeOfPolymerisation'] = self.degreeOfPolymerisation.map{ |x| x.as_json(*args) }
      end
      unless self.structuralRepresentation.nil?  || !self.structuralRepresentation.any? 
        result['structuralRepresentation'] = self.structuralRepresentation.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstancePolymerRepeatRepeatUnit.new)
      result = self.superclass.transform_json(json_hash, target)
      result['orientationOfPolymerisation'] = CodeableConcept.transform_json(json_hash['orientationOfPolymerisation']) unless json_hash['orientationOfPolymerisation'].nil?
      result['repeatUnit'] = PrimitiveString.transform_json(json_hash['repeatUnit'], json_hash['_repeatUnit']) unless json_hash['repeatUnit'].nil?
      result['amount'] = SubstanceAmount.transform_json(json_hash['amount']) unless json_hash['amount'].nil?
      result['degreeOfPolymerisation'] = json_hash['degreeOfPolymerisation'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          SubstancePolymerRepeatRepeatUnitDegreeOfPolymerisation.transform_json(var) 
        end
      } unless json_hash['degreeOfPolymerisation'].nil?
      result['structuralRepresentation'] = json_hash['structuralRepresentation'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          SubstancePolymerRepeatRepeatUnitStructuralRepresentation.transform_json(var) 
        end
      } unless json_hash['structuralRepresentation'].nil?

      result
    end
  end
end
