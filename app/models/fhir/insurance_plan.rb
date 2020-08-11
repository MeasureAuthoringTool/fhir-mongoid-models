module FHIR
  # fhir/insurance_plan.rb
  class InsurancePlan < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::PublicationStatus'    
    embeds_many :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_many :alias, class_name: 'FHIR::PrimitiveString'    
    embeds_one :period, class_name: 'FHIR::Period'    
    embeds_one :ownedBy, class_name: 'FHIR::Reference'    
    embeds_one :administeredBy, class_name: 'FHIR::Reference'    
    embeds_many :coverageArea, class_name: 'FHIR::Reference'    
    embeds_many :contact, class_name: 'FHIR::InsurancePlanContact'    
    embeds_many :endpoint, class_name: 'FHIR::Reference'    
    embeds_many :network, class_name: 'FHIR::Reference'    
    embeds_many :coverage, class_name: 'FHIR::InsurancePlanCoverage'    
    embeds_many :plan, class_name: 'FHIR::InsurancePlanPlan'    
    
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
      unless self.type.nil?  || !self.type.any? 
        result['type'] = self.type.map{ |x| x.as_json(*args) }
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
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      unless self.ownedBy.nil? 
        result['ownedBy'] = self.ownedBy.as_json(*args)
      end
      unless self.administeredBy.nil? 
        result['administeredBy'] = self.administeredBy.as_json(*args)
      end
      unless self.coverageArea.nil?  || !self.coverageArea.any? 
        result['coverageArea'] = self.coverageArea.map{ |x| x.as_json(*args) }
      end
      unless self.contact.nil?  || !self.contact.any? 
        result['contact'] = self.contact.map{ |x| x.as_json(*args) }
      end
      unless self.endpoint.nil?  || !self.endpoint.any? 
        result['endpoint'] = self.endpoint.map{ |x| x.as_json(*args) }
      end
      unless self.network.nil?  || !self.network.any? 
        result['network'] = self.network.map{ |x| x.as_json(*args) }
      end
      unless self.coverage.nil?  || !self.coverage.any? 
        result['coverage'] = self.coverage.map{ |x| x.as_json(*args) }
      end
      unless self.plan.nil?  || !self.plan.any? 
        result['plan'] = self.plan.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = InsurancePlan.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = PublicationStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['type'] = json_hash['type'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['type'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['alias'] = json_hash['alias'].each_with_index.map do |var, i|
        extension_hash = json_hash['_alias'] && json_hash['_alias'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['alias'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?
      result['ownedBy'] = Reference.transform_json(json_hash['ownedBy']) unless json_hash['ownedBy'].nil?
      result['administeredBy'] = Reference.transform_json(json_hash['administeredBy']) unless json_hash['administeredBy'].nil?
      result['coverageArea'] = json_hash['coverageArea'].map { |var| Reference.transform_json(var) } unless json_hash['coverageArea'].nil?
      result['contact'] = json_hash['contact'].map { |var| InsurancePlanContact.transform_json(var) } unless json_hash['contact'].nil?
      result['endpoint'] = json_hash['endpoint'].map { |var| Reference.transform_json(var) } unless json_hash['endpoint'].nil?
      result['network'] = json_hash['network'].map { |var| Reference.transform_json(var) } unless json_hash['network'].nil?
      result['coverage'] = json_hash['coverage'].map { |var| InsurancePlanCoverage.transform_json(var) } unless json_hash['coverage'].nil?
      result['plan'] = json_hash['plan'].map { |var| InsurancePlanPlan.transform_json(var) } unless json_hash['plan'].nil?

      result
    end
  end
end
