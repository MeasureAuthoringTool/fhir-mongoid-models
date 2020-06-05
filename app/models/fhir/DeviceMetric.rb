module FHIR
  class DeviceMetric < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceMetric'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :unit, class_name: 'CodeableConcept'
    embeds_one :source, class_name: 'Reference'
    embeds_one :parent, class_name: 'Reference'
    embeds_one :operationalStatus, class_name: 'DeviceMetricOperationalStatus'
    embeds_one :color, class_name: 'DeviceMetricColor'
    embeds_one :category, class_name: 'DeviceMetricCategory'
    embeds_one :measurementPeriod, class_name: 'Timing'
    embeds_many :calibration, class_name: 'DeviceMetricCalibration'
  end
end
