module FHIR
  # fhir/consent_provision.rb
  class ConsentProvision < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ConsentProvision'
    embeds_one :type, class_name: 'ConsentProvisionType'
    embeds_one :period, class_name: 'Period'
    embeds_many :actor, class_name: 'ConsentProvisionActor'
    embeds_many :action, class_name: 'CodeableConcept'
    embeds_many :securityLabel, class_name: 'Coding'
    embeds_many :purpose, class_name: 'Coding'
    embeds_many :class, class_name: 'Coding'
    embeds_many :code, class_name: 'CodeableConcept'
    embeds_one :dataPeriod, class_name: 'Period'
    embeds_many :data, class_name: 'ConsentProvisionData'
    embeds_many :provision, class_name: 'ConsentProvision'

    def self.transform_json(json_hash)
      result = ConsentProvision.new
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
