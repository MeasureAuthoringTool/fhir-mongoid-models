module FHIR
  # fhir/device_metric.rb
  class DeviceMetric < DomainResource
    include Mongoid::Document
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

    def self.transform_json(json_hash, target = DeviceMetric.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['unit'] = CodeableConcept.transform_json(json_hash['unit']) unless json_hash['unit'].nil?      
      result['source'] = Reference.transform_json(json_hash['source']) unless json_hash['source'].nil?      
      result['parent'] = Reference.transform_json(json_hash['parent']) unless json_hash['parent'].nil?      
      result['operationalStatus'] = DeviceMetricOperationalStatus.transform_json(json_hash['operationalStatus']) unless json_hash['operationalStatus'].nil?      
      result['color'] = DeviceMetricColor.transform_json(json_hash['color']) unless json_hash['color'].nil?      
      result['category'] = DeviceMetricCategory.transform_json(json_hash['category']) unless json_hash['category'].nil?      
      result['measurementPeriod'] = Timing.transform_json(json_hash['measurementPeriod']) unless json_hash['measurementPeriod'].nil?      
      result['calibration'] = json_hash['calibration'].map { |var| DeviceMetricCalibration.transform_json(var) } unless json_hash['calibration'].nil?

      result
    end
  end
end
