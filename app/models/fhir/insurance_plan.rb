module FHIR
  # fhir/insurance_plan.rb
  class InsurancePlan < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'InsurancePlan'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'PublicationStatus'
    embeds_many :type, class_name: 'CodeableConcept'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_many :alias, class_name: 'PrimitiveString'
    embeds_one :period, class_name: 'Period'
    embeds_one :ownedBy, class_name: 'Reference'
    embeds_one :administeredBy, class_name: 'Reference'
    embeds_many :coverageArea, class_name: 'Reference'
    embeds_many :contact, class_name: 'InsurancePlanContact'
    embeds_many :endpoint, class_name: 'Reference'
    embeds_many :network, class_name: 'Reference'
    embeds_many :coverage, class_name: 'InsurancePlanCoverage'
    embeds_many :plan, class_name: 'InsurancePlanPlan'

    def self.transform_json(json_hash, target=InsurancePlan.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = PublicationStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
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
