module FHIR
  # fhir/timing_repeat.rb
  class TimingRepeat < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'TimingRepeat'
    embeds_one :boundsDuration, class_name: 'Duration'
    embeds_one :boundsRange, class_name: 'Range'
    embeds_one :boundsPeriod, class_name: 'Period'
    embeds_one :count, class_name: 'PrimitivePositiveInt'
    embeds_one :countMax, class_name: 'PrimitivePositiveInt'
    embeds_one :duration, class_name: 'PrimitiveDecimal'
    embeds_one :durationMax, class_name: 'PrimitiveDecimal'
    embeds_one :durationUnit, class_name: 'UnitsOfTime'
    embeds_one :frequency, class_name: 'PrimitivePositiveInt'
    embeds_one :frequencyMax, class_name: 'PrimitivePositiveInt'
    embeds_one :period, class_name: 'PrimitiveDecimal'
    embeds_one :periodMax, class_name: 'PrimitiveDecimal'
    embeds_one :periodUnit, class_name: 'UnitsOfTime'
    embeds_many :dayOfWeek, class_name: 'DayOfWeek'
    embeds_many :timeOfDay, class_name: 'PrimitiveTime'
    embeds_many :when, class_name: 'EventTiming'
    embeds_one :offset, class_name: 'PrimitiveUnsignedInt'

    def self.transform_json(json_hash, target=TimingRepeat.new)
      result = self.superclass.transform_json(json_hash, target)
      result['boundsDuration'] = Duration.transform_json(json_hash['boundsDuration']) unless json_hash['boundsDuration'].nil?      
      result['boundsRange'] = Range.transform_json(json_hash['boundsRange']) unless json_hash['boundsRange'].nil?      
      result['boundsPeriod'] = Period.transform_json(json_hash['boundsPeriod']) unless json_hash['boundsPeriod'].nil?      
      result['count'] = PrimitivePositiveInt.transform_json(json_hash['count'], json_hash['_count']) unless json_hash['count'].nil?      
      result['countMax'] = PrimitivePositiveInt.transform_json(json_hash['countMax'], json_hash['_countMax']) unless json_hash['countMax'].nil?      
      result['duration'] = PrimitiveDecimal.transform_json(json_hash['duration'], json_hash['_duration']) unless json_hash['duration'].nil?      
      result['durationMax'] = PrimitiveDecimal.transform_json(json_hash['durationMax'], json_hash['_durationMax']) unless json_hash['durationMax'].nil?      
      result['durationUnit'] = UnitsOfTime.transform_json(json_hash['durationUnit']) unless json_hash['durationUnit'].nil?      
      result['frequency'] = PrimitivePositiveInt.transform_json(json_hash['frequency'], json_hash['_frequency']) unless json_hash['frequency'].nil?      
      result['frequencyMax'] = PrimitivePositiveInt.transform_json(json_hash['frequencyMax'], json_hash['_frequencyMax']) unless json_hash['frequencyMax'].nil?      
      result['period'] = PrimitiveDecimal.transform_json(json_hash['period'], json_hash['_period']) unless json_hash['period'].nil?      
      result['periodMax'] = PrimitiveDecimal.transform_json(json_hash['periodMax'], json_hash['_periodMax']) unless json_hash['periodMax'].nil?      
      result['periodUnit'] = UnitsOfTime.transform_json(json_hash['periodUnit']) unless json_hash['periodUnit'].nil?      
      result['dayOfWeek'] = json_hash['dayOfWeek'].map { |var| DayOfWeek.transform_json(var) } unless json_hash['dayOfWeek'].nil?
      result['timeOfDay'] = json_hash['timeOfDay'].each_with_index.map do |var, i|
        extension_hash = json_hash['_timeOfDay'] && json_hash['_timeOfDay'][i]
        PrimitiveTime.transform_json(var, extension_hash)
      end unless json_hash['timeOfDay'].nil?
      result['when'] = json_hash['when'].map { |var| EventTiming.transform_json(var) } unless json_hash['when'].nil?
      result['offset'] = PrimitiveUnsignedInt.transform_json(json_hash['offset'], json_hash['_offset']) unless json_hash['offset'].nil?      

      result
    end
  end
end
