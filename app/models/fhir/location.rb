module FHIR
  # fhir/location.rb
  class Location < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::LocationStatus'    
    embeds_one :operationalStatus, class_name: 'FHIR::Coding'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_many :alias, class_name: 'FHIR::PrimitiveString'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :mode, class_name: 'FHIR::LocationMode'    
    embeds_many :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :telecom, class_name: 'FHIR::ContactPoint'    
    embeds_one :address, class_name: 'FHIR::Address'    
    embeds_one :physicalType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :position, class_name: 'FHIR::LocationPosition'    
    embeds_one :managingOrganization, class_name: 'FHIR::Reference'    
    embeds_one :partOf, class_name: 'FHIR::Reference'    
    embeds_many :hoursOfOperation, class_name: 'FHIR::LocationHoursOfOperation'    
    embeds_one :availabilityExceptions, class_name: 'FHIR::PrimitiveString'    
    embeds_many :endpoint, class_name: 'FHIR::Reference'    
    
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
      unless self.operationalStatus.nil? 
        result['operationalStatus'] = self.operationalStatus.as_json(*args)
      end
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.alias.nil?  || !self.alias.any? 
        result['alias'] = self.alias.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.alias)                              
        result['_alias'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.mode.nil? 
        result['mode'] = self.mode.value
        serialized = Extension.serializePrimitiveExtension(self.mode)            
        result['_mode'] = serialized unless serialized.nil?
      end
      unless self.type.nil?  || !self.type.any? 
        result['type'] = self.type.map{ |x| x.as_json(*args) }
      end
      unless self.telecom.nil?  || !self.telecom.any? 
        result['telecom'] = self.telecom.map{ |x| x.as_json(*args) }
      end
      unless self.address.nil? 
        result['address'] = self.address.as_json(*args)
      end
      unless self.physicalType.nil? 
        result['physicalType'] = self.physicalType.as_json(*args)
      end
      unless self.position.nil? 
        result['position'] = self.position.as_json(*args)
      end
      unless self.managingOrganization.nil? 
        result['managingOrganization'] = self.managingOrganization.as_json(*args)
      end
      unless self.partOf.nil? 
        result['partOf'] = self.partOf.as_json(*args)
      end
      unless self.hoursOfOperation.nil?  || !self.hoursOfOperation.any? 
        result['hoursOfOperation'] = self.hoursOfOperation.map{ |x| x.as_json(*args) }
      end
      unless self.availabilityExceptions.nil? 
        result['availabilityExceptions'] = self.availabilityExceptions.value
        serialized = Extension.serializePrimitiveExtension(self.availabilityExceptions)            
        result['_availabilityExceptions'] = serialized unless serialized.nil?
      end
      unless self.endpoint.nil?  || !self.endpoint.any? 
        result['endpoint'] = self.endpoint.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Location.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['status'] = LocationStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['operationalStatus'] = Coding.transform_json(json_hash['operationalStatus']) unless json_hash['operationalStatus'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['alias'] = json_hash['alias'].each_with_index.map do |var, i|
        extension_hash = json_hash['_alias'] && json_hash['_alias'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['alias'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['mode'] = LocationMode.transform_json(json_hash['mode'], json_hash['_mode']) unless json_hash['mode'].nil?
      result['type'] = json_hash['type'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['type'].nil?
      result['telecom'] = json_hash['telecom'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ContactPoint.transform_json(var) 
        end
      } unless json_hash['telecom'].nil?
      result['address'] = Address.transform_json(json_hash['address']) unless json_hash['address'].nil?
      result['physicalType'] = CodeableConcept.transform_json(json_hash['physicalType']) unless json_hash['physicalType'].nil?
      result['position'] = LocationPosition.transform_json(json_hash['position']) unless json_hash['position'].nil?
      result['managingOrganization'] = Reference.transform_json(json_hash['managingOrganization']) unless json_hash['managingOrganization'].nil?
      result['partOf'] = Reference.transform_json(json_hash['partOf']) unless json_hash['partOf'].nil?
      result['hoursOfOperation'] = json_hash['hoursOfOperation'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          LocationHoursOfOperation.transform_json(var) 
        end
      } unless json_hash['hoursOfOperation'].nil?
      result['availabilityExceptions'] = PrimitiveString.transform_json(json_hash['availabilityExceptions'], json_hash['_availabilityExceptions']) unless json_hash['availabilityExceptions'].nil?
      result['endpoint'] = json_hash['endpoint'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['endpoint'].nil?

      result
    end
  end
end
