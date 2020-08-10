module FHIR
  # fhir/group.rb
  class Group < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :active, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :type, class_name: 'FHIR::GroupType'    
    embeds_one :actual, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :quantity, class_name: 'FHIR::PrimitiveUnsignedInt'    
    embeds_one :managingEntity, class_name: 'FHIR::Reference'    
    embeds_many :characteristic, class_name: 'FHIR::GroupCharacteristic'    
    embeds_many :member, class_name: 'FHIR::GroupMember'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.active.nil? 
        result['active'] = self.active.value
        serialized = Extension.serializePrimitiveExtension(self.active)            
        result['_active'] = serialized unless serialized.nil?
      end
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.actual.nil? 
        result['actual'] = self.actual.value
        serialized = Extension.serializePrimitiveExtension(self.actual)            
        result['_actual'] = serialized unless serialized.nil?
      end
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.quantity.nil? 
        result['quantity'] = self.quantity.value
        serialized = Extension.serializePrimitiveExtension(self.quantity)            
        result['_quantity'] = serialized unless serialized.nil?
      end
      unless self.managingEntity.nil? 
        result['managingEntity'] = self.managingEntity.as_json(*args)
      end
      unless self.characteristic.nil?  || !self.characteristic.any? 
        result['characteristic'] = self.characteristic.map{ |x| x.as_json(*args) }
      end
      unless self.member.nil?  || !self.member.any? 
        result['member'] = self.member.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Group.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['active'] = PrimitiveBoolean.transform_json(json_hash['active'], json_hash['_active']) unless json_hash['active'].nil?
      result['type'] = GroupType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['actual'] = PrimitiveBoolean.transform_json(json_hash['actual'], json_hash['_actual']) unless json_hash['actual'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['quantity'] = PrimitiveUnsignedInt.transform_json(json_hash['quantity'], json_hash['_quantity']) unless json_hash['quantity'].nil?
      result['managingEntity'] = Reference.transform_json(json_hash['managingEntity']) unless json_hash['managingEntity'].nil?
      result['characteristic'] = json_hash['characteristic'].map { |var| GroupCharacteristic.transform_json(var) } unless json_hash['characteristic'].nil?
      result['member'] = json_hash['member'].map { |var| GroupMember.transform_json(var) } unless json_hash['member'].nil?

      result
    end
  end
end
