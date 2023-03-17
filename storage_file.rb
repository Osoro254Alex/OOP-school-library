require 'json'

class DataFile
  def initialize(file_name)
    @path = "store/#{file_name}.json"
    File.write(@path, '[]') unless File.file?(@path)
  end

  def save_data(data)
    json = JSON.generate(data)
    File.write(@path, json)
  end

  def load_data()
    data = File.read(@path)
    JSON.parse(data)
  end
end
