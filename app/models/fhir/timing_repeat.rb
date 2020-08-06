module FHIR
  # fhir/timing_repeat.rb
  class TimingRepeat < Element
    include Mongoid::Document
    embeds_one :boundsDuration, class_name: 'FHIR::Duration'    
    embeds_one :boundsRange, class_name: 'FHIR::Range'    
    embeds_one :boundsPeriod, class_name: 'FHIR::Period'    
    embeds_one :count, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :countMax, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :duration, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :durationMax, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :durationUnit, class_name: 'FHIR::UnitsOfTime'    
    embeds_one :frequency, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :frequencyMax, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :period, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :periodMax, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :periodUnit, class_name: 'FHIR::UnitsOfTime'    
    embeds_many :dayOfWeek, class_name: 'FHIR::DayOfWeek'    
    embeds_many :timeOfDay, class_name: 'FHIR::PrimitiveTime'    
    embeds_many :when, class_name: 'FHIR::EventTiming'    
    embeds_one :offset, class_name: 'FHIR::PrimitiveUnsignedInt'    
    
    def as_json(*args)
      result = super      
      unless self.boundsDuration.nil?
        result['boundsDuration'] = self.boundsDuration.as_json(*args)                        
      end          
      unless self.boundsRange.nil?
        result['boundsRange'] = self.boundsRange.as_json(*args)                        
      end          
      unless self.boundsPeriod.nil?
        result['boundsPeriod'] = self.boundsPeriod.as_json(*args)                        
      end          
      unless self.count.nil? 
        result['count'] = self.count.value
        serialized = Extension.serializePrimitiveExtension(self.count)            
        result['_count'] = serialized unless serialized.nil?
      end
      unless self.countMax.nil? 
        result['countMax'] = self.countMax.value
        serialized = Extension.serializePrimitiveExtension(self.countMax)            
        result['_countMax'] = serialized unless serialized.nil?
      end
      unless self.duration.nil? 
        result['duration'] = self.duration.value
        serialized = Extension.serializePrimitiveExtension(self.duration)            
        result['_duration'] = serialized unless serialized.nil?
      end
      unless self.durationMax.nil? 
        result['durationMax'] = self.durationMax.value
        serialized = Extension.serializePrimitiveExtension(self.durationMax)            
        result['_durationMax'] = serialized unless serialized.nil?
      end
      unless self.durationUnit.nil? 
        result['durationUnit'] = self.durationUnit.value
        serialized = Extension.serializePrimitiveExtension(self.durationUnit)            
        result['_durationUnit'] = serialized unless serialized.nil?
      end
      unless self.frequency.nil? 
        result['frequency'] = self.frequency.value
        serialized = Extension.serializePrimitiveExtension(self.frequency)            
        result['_frequency'] = serialized unless serialized.nil?
      end
      unless self.frequencyMax.nil? 
        result['frequencyMax'] = self.frequencyMax.value
        serialized = Extension.serializePrimitiveExtension(self.frequencyMax)            
        result['_frequencyMax'] = serialized unless serialized.nil?
      end
      unless self.period.nil? 
        result['period'] = self.period.value
        serialized = Extension.serializePrimitiveExtension(self.period)            
        result['_period'] = serialized unless serialized.nil?
      end
      unless self.periodMax.nil? 
        result['periodMax'] = self.periodMax.value
        serialized = Extension.serializePrimitiveExtension(self.periodMax)            
        result['_periodMax'] = serialized unless serialized.nil?
      end
      unless self.periodUnit.nil? 
        result['periodUnit'] = self.periodUnit.value
        serialized = Extension.serializePrimitiveExtension(self.periodUnit)            
        result['_periodUnit'] = serialized unless serialized.nil?
      end
      unless self.dayOfWeek.nil?  || !self.dayOfWeek.any? 
        result['dayOfWeek'] = self.dayOfWeek.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.dayOfWeek)                              
        result['_dayOfWeek'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.timeOfDay.nil?  || !self.timeOfDay.any? 
        result['timeOfDay'] = self.timeOfDay.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.timeOfDay)                              
        result['_timeOfDay'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.when.nil?  || !self.when.any? 
        result['when'] = self.when.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.when)                              
        result['_when'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.offset.nil? 
        result['offset'] = self.offset.value
        serialized = Extension.serializePrimitiveExtension(self.offset)            
        result['_offset'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = TimingRepeat.new)
      result = self.superclass.transform_json(json_hash, target)
      result['boundsDuration'] = Duration.transform_json(json_hash['boundsDuration']) unless json_hash['boundsDuration'].nil?
      result['boundsRange'] = Range.transform_json(json_hash['boundsRange']) unless json_hash['boundsRange'].nil?
      result['boundsPeriod'] = Period.transform_json(json_hash['boundsPeriod']) unless json_hash['boundsPeriod'].nil?
      result['count'] = PrimitivePositiveInt.transform_json(json_hash['count'], json_hash['_count']) unless json_hash['count'].nil?
      result['countMax'] = PrimitivePositiveInt.transform_json(json_hash['countMax'], json_hash['_countMax']) unless json_hash['countMax'].nil?
      result['duration'] = PrimitiveDecimal.transform_json(json_hash['duration'], json_hash['_duration']) unless json_hash['duration'].nil?
      result['durationMax'] = PrimitiveDecimal.transform_json(json_hash['durationMax'], json_hash['_durationMax']) unless json_hash['durationMax'].nil?
      result['durationUnit'] = UnitsOfTime.transform_json(json_hash['durationUnit'], json_hash['_durationUnit']) unless json_hash['durationUnit'].nil?
      result['frequency'] = PrimitivePositiveInt.transform_json(json_hash['frequency'], json_hash['_frequency']) unless json_hash['frequency'].nil?
      result['frequencyMax'] = PrimitivePositiveInt.transform_json(json_hash['frequencyMax'], json_hash['_frequencyMax']) unless json_hash['frequencyMax'].nil?
      result['period'] = PrimitiveDecimal.transform_json(json_hash['period'], json_hash['_period']) unless json_hash['period'].nil?
      result['periodMax'] = PrimitiveDecimal.transform_json(json_hash['periodMax'], json_hash['_periodMax']) unless json_hash['periodMax'].nil?
      result['periodUnit'] = UnitsOfTime.transform_json(json_hash['periodUnit'], json_hash['_periodUnit']) unless json_hash['periodUnit'].nil?
      result['dayOfWeek'] = json_hash['dayOfWeek'].each_with_index.map do |var, i|
        extension_hash = json_hash['_dayOfWeek'] && json_hash['_dayOfWeek'][i]
        DayOfWeek.transform_json(var, extension_hash)
      end unless json_hash['dayOfWeek'].nil?
      result['timeOfDay'] = json_hash['timeOfDay'].each_with_index.map do |var, i|
        extension_hash = json_hash['_timeOfDay'] && json_hash['_timeOfDay'][i]
        PrimitiveTime.transform_json(var, extension_hash)
      end unless json_hash['timeOfDay'].nil?
      result['when'] = json_hash['when'].each_with_index.map do |var, i|
        extension_hash = json_hash['_when'] && json_hash['_when'][i]
        EventTiming.transform_json(var, extension_hash)
      end unless json_hash['when'].nil?
      result['offset'] = PrimitiveUnsignedInt.transform_json(json_hash['offset'], json_hash['_offset']) unless json_hash['offset'].nil?

      result
    end
  end
end
