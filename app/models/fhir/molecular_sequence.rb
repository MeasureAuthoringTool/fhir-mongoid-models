module FHIR
  # fhir/molecular_sequence.rb
  class MolecularSequence < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :type, class_name: 'FHIR::SequenceType'    
    embeds_one :coordinateSystem, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :patient, class_name: 'FHIR::Reference'    
    embeds_one :specimen, class_name: 'FHIR::Reference'    
    embeds_one :device, class_name: 'FHIR::Reference'    
    embeds_one :performer, class_name: 'FHIR::Reference'    
    embeds_one :quantity, class_name: 'FHIR::Quantity'    
    embeds_one :referenceSeq, class_name: 'FHIR::MolecularSequenceReferenceSeq'    
    embeds_many :variant, class_name: 'FHIR::MolecularSequenceVariant'    
    embeds_one :observedSeq, class_name: 'FHIR::PrimitiveString'    
    embeds_many :quality, class_name: 'FHIR::MolecularSequenceQuality'    
    embeds_one :readCoverage, class_name: 'FHIR::PrimitiveInteger'    
    embeds_many :repository, class_name: 'FHIR::MolecularSequenceRepository'    
    embeds_many :pointer, class_name: 'FHIR::Reference'    
    embeds_many :structureVariant, class_name: 'FHIR::MolecularSequenceStructureVariant'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.coordinateSystem.nil? 
        result['coordinateSystem'] = self.coordinateSystem.value
        serialized = Extension.serializePrimitiveExtension(self.coordinateSystem)            
        result['_coordinateSystem'] = serialized unless serialized.nil?
      end
      unless self.patient.nil? 
        result['patient'] = self.patient.as_json(*args)
      end
      unless self.specimen.nil? 
        result['specimen'] = self.specimen.as_json(*args)
      end
      unless self.device.nil? 
        result['device'] = self.device.as_json(*args)
      end
      unless self.performer.nil? 
        result['performer'] = self.performer.as_json(*args)
      end
      unless self.quantity.nil? 
        result['quantity'] = self.quantity.as_json(*args)
      end
      unless self.referenceSeq.nil? 
        result['referenceSeq'] = self.referenceSeq.as_json(*args)
      end
      unless self.variant.nil?  || !self.variant.any? 
        result['variant'] = self.variant.map{ |x| x.as_json(*args) }
      end
      unless self.observedSeq.nil? 
        result['observedSeq'] = self.observedSeq.value
        serialized = Extension.serializePrimitiveExtension(self.observedSeq)            
        result['_observedSeq'] = serialized unless serialized.nil?
      end
      unless self.quality.nil?  || !self.quality.any? 
        result['quality'] = self.quality.map{ |x| x.as_json(*args) }
      end
      unless self.readCoverage.nil? 
        result['readCoverage'] = self.readCoverage.value
        serialized = Extension.serializePrimitiveExtension(self.readCoverage)            
        result['_readCoverage'] = serialized unless serialized.nil?
      end
      unless self.repository.nil?  || !self.repository.any? 
        result['repository'] = self.repository.map{ |x| x.as_json(*args) }
      end
      unless self.pointer.nil?  || !self.pointer.any? 
        result['pointer'] = self.pointer.map{ |x| x.as_json(*args) }
      end
      unless self.structureVariant.nil?  || !self.structureVariant.any? 
        result['structureVariant'] = self.structureVariant.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MolecularSequence.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['type'] = SequenceType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['coordinateSystem'] = PrimitiveInteger.transform_json(json_hash['coordinateSystem'], json_hash['_coordinateSystem']) unless json_hash['coordinateSystem'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?
      result['specimen'] = Reference.transform_json(json_hash['specimen']) unless json_hash['specimen'].nil?
      result['device'] = Reference.transform_json(json_hash['device']) unless json_hash['device'].nil?
      result['performer'] = Reference.transform_json(json_hash['performer']) unless json_hash['performer'].nil?
      result['quantity'] = Quantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?
      result['referenceSeq'] = MolecularSequenceReferenceSeq.transform_json(json_hash['referenceSeq']) unless json_hash['referenceSeq'].nil?
      result['variant'] = json_hash['variant'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          MolecularSequenceVariant.transform_json(var) 
        end
      } unless json_hash['variant'].nil?
      result['observedSeq'] = PrimitiveString.transform_json(json_hash['observedSeq'], json_hash['_observedSeq']) unless json_hash['observedSeq'].nil?
      result['quality'] = json_hash['quality'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          MolecularSequenceQuality.transform_json(var) 
        end
      } unless json_hash['quality'].nil?
      result['readCoverage'] = PrimitiveInteger.transform_json(json_hash['readCoverage'], json_hash['_readCoverage']) unless json_hash['readCoverage'].nil?
      result['repository'] = json_hash['repository'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          MolecularSequenceRepository.transform_json(var) 
        end
      } unless json_hash['repository'].nil?
      result['pointer'] = json_hash['pointer'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['pointer'].nil?
      result['structureVariant'] = json_hash['structureVariant'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          MolecularSequenceStructureVariant.transform_json(var) 
        end
      } unless json_hash['structureVariant'].nil?

      result
    end
  end
end
