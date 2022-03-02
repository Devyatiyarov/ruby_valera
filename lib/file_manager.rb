class FileManager
  def initialize
    @save_file_location = '/storage/saved_game.json'
    @config_file_location = '/storage/actions.json'
  end

  def save(valera)
    hash = {
      'health' => valera.health,
      'alcohol' => valera.alcohol,
      'happy' => valera.happy,
      'tired' => valera.tired,
      'money' => valera.money
    }

    File.open(File.dirname(__FILE__) + @save_file_location, 'w') do |f|
      f.write(JSON.pretty_generate(hash))
    end
  end

  def load_game
    file_new = File.open(File.dirname(__FILE__) + @save_file_location)
    JSON.parse(file_new.read)
  end

  def load_config
    file = File.open(File.dirname(__FILE__) + @config_file_location)
    JSON.parse(file.read)
  end
end
