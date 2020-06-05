module FHIR
  class DeviceMetricCalibrationState < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceMetricCalibrationState'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
