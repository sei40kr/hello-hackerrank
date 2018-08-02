require 'json'

class MapReduce

	def initialize
		warn "Intermediate"
		@intermediate = Hash.new{|x,y|x[y]=Array.new}
		@finalResult = []
	end

	def emitIntermediate(key, value)
		@intermediate[key] += [value]
	end

	def emit(value)
		@finalResult += [value]
	end

	# Return an array of JSONs
	def execute(data, mapper, reducer)
		outputJsons = []
		data.each do |line|
			record = JSON.parse(line)
			mapper(self,record)
		end

		@intermediate.keys.each do |key|
			reducer(self,key,@intermediate[key])
		end


		@finalResult.each do |item|
			outputMap = Hash.new
			outputMap["key"] = item.key
			outputMap["value"] = item.value
			outputJsons += [outputMap.to_json]
		end
		return outputJsons
	end
end

class Pair
	attr_accessor :key, :value

	def initialize(key,value)
		@key = key
		@value = value
	end
end

def mapper(mapred,record)
	value = record["value"].to_i
  # Fill up the question marks in the if - predicate below
	if value % 2 == 1 and 10 < value
		mapred.emitIntermediate(value,1)
	end
end

def reducer(mapred,key,list_of_values)
	resultPair = Pair.new(key,key)
	mapred.emit(resultPair)
end

inputData = []
counter = 0
Nr = gets().to_i
(1..Nr).each do |num|
	inputData += [{"key"=>counter,"value"=>gets().strip}.to_json]
	counter += 1
end
@mapred = MapReduce.new()
outputJsons = @mapred.execute(inputData,method(:mapper),method(:reducer))
outputJsons.each do |json|
	puts JSON.parse(json)["value"]
end
