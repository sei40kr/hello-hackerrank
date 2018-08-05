# Enter your code here. Read input from STDIN. Print output to STDOUT
require 'json'

class MapReduce
  def initialize
    @intermediate = Hash.new { |x, y| x[y] = [] }
    @finalResult = []
  end

  def emitIntermediate(key, value)
    @intermediate[key] += [value]
  end

  def emit(value)
    @finalResult += [value]
  end

  def execute(data, _mapper, _reducer)
    data.each do |line|
      warn "Parsing the following Key-Value Pair and passing it to the Mapper function:#{data}"
      record = JSON.parse(line)
      mapper(self, record)
    end

    @intermediate.keys.each do |key|
      reducer(self, key, @intermediate[key])
    end

    @finalResult.each do |item|
      outputMap = {}
      outputMap['key'] = item.key
      outputMap['value'] = item.value
      puts outputMap.to_json
    end
  end
end

class Pair
  attr_accessor :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

def mapper(mapred, record)
  state = record['key']
  city = record['value']
  # COMPLETE THE LINE BELOW BY FILLING UP THE QUESTION MARKS AND UN-COMMENTING THE CODE
  mapred.emitIntermediate(state, city)
end

def reducer(mapred, key, list_of_values)
  # COMPLETE THE LINE BELOW BY FILLING UP THE QUESTION MARKS AND UN-COMMENTING THE CODE
  list_of_cities = list_of_values.sort.join(',')
  resultPair = Pair.new(key, list_of_cities)
  mapred.emit(resultPair)
end

inputData = []
while line = gets
  state, city = line.strip.split("\t")
  inputData += [{ 'key' => state, 'value' => city }.to_json]
end
@mapred = MapReduce.new
@mapred.execute(inputData, method(:mapper), method(:reducer))
