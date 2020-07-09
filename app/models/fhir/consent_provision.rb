module FHIR
  # fhir/consent_provision.rb
  class ConsentProvision < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::ConsentProvisionType'
    embeds_one :period, class_name: 'FHIR::Period'
    embeds_many :actor, class_name: 'FHIR::ConsentProvisionActor'
    embeds_many :action, class_name: 'FHIR::CodeableConcept'
    embeds_many :securityLabel, class_name: 'FHIR::Coding'
    embeds_many :purpose, class_name: 'FHIR::Coding'
    embeds_many :class, class_name: 'FHIR::Coding'
    embeds_many :code, class_name: 'FHIR::CodeableConcept'
    embeds_one :dataPeriod, class_name: 'FHIR::Period'
    embeds_many :data, class_name: 'FHIR::ConsentProvisionData'
    embeds_many :provision, class_name: 'FHIR::ConsentProvision'

    def self.transform_json(json_hash, target = ConsentProvision.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = ConsentProvisionType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      
      result['actor'] = json_hash['actor'].map { |var| ConsentProvisionActor.transform_json(var) } unless json_hash['actor'].nil?
      result['action'] = json_hash['action'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['action'].nil?
      result['securityLabel'] = json_hash['securityLabel'].map { |var| Coding.transform_json(var) } unless json_hash['securityLabel'].nil?
      result['purpose'] = json_hash['purpose'].map { |var| Coding.transform_json(var) } unless json_hash['purpose'].nil?
      result['class'] = json_hash['class'].map { |var| Coding.transform_json(var) } unless json_hash['class'].nil?
      result['code'] = json_hash['code'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['code'].nil?
      result['dataPeriod'] = Period.transform_json(json_hash['dataPeriod']) unless json_hash['dataPeriod'].nil?      
      result['data'] = json_hash['data'].map { |var| ConsentProvisionData.transform_json(var) } unless json_hash['data'].nil?
      result['provision'] = json_hash['provision'].map { |var| ConsentProvision.transform_json(var) } unless json_hash['provision'].nil?

      result
    end
  end
end
