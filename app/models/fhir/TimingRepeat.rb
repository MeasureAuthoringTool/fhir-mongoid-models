module FHIR
  class TimingRepeat < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'TimingRepeat'
    embeds_one :boundsDuration, class_name: 'Duration'
    embeds_one :boundsRange, class_name: 'Range'
    embeds_one :boundsPeriod, class_name: 'Period'
    field :count, type:  # primitive
    embeds_one :_count, class_name: 'Extension'
    field :countMax, type:  # primitive
    embeds_one :_countMax, class_name: 'Extension'
    field :duration, type:  # primitive
    embeds_one :_duration, class_name: 'Extension'
    field :durationMax, type:  # primitive
    embeds_one :_durationMax, class_name: 'Extension'
    embeds_one :durationUnit, class_name: 'UnitsOfTime'
    field :frequency, type:  # primitive
    embeds_one :_frequency, class_name: 'Extension'
    field :frequencyMax, type:  # primitive
    embeds_one :_frequencyMax, class_name: 'Extension'
    field :period, type:  # primitive
    embeds_one :_period, class_name: 'Extension'
    field :periodMax, type:  # primitive
    embeds_one :_periodMax, class_name: 'Extension'
    embeds_one :periodUnit, class_name: 'UnitsOfTime'
    embeds_many :dayOfWeek, class_name: 'DayOfWeek'
    field :timeOfDay, type: Array # primitive
    embeds_many :_timeOfDay, class_name: 'Extension'
    embeds_many :when, class_name: 'EventTiming'
    field :offset, type:  # primitive
    embeds_one :_offset, class_name: 'Extension'
  end
end
