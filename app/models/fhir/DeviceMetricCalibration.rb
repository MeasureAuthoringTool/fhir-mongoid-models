module FHIR
  class DeviceMetricCalibration < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceMetricCalibration'
    embeds_one :type, class_name: 'DeviceMetricCalibrationType'
    embeds_one :state, class_name: 'DeviceMetricCalibrationState'
    field :time, type:  # primitive
    embeds_one :_time, class_name: 'Extension'
  end
end
