module FHIR
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
  end
end
