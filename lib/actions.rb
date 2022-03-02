require_relative './file_manager'
require_relative './view'
require 'json'
require 'io/console'
require_relative './game_states'

class Actions
  def change_attribute(name, value, valera)
    valera.send("#{name}=", valera.send(name) + value)
  end

  def change_attributes(action, valera)
    action['result'].each do |effect|
      change_attribute(effect['name'], effect['value'], valera)
      next unless effect.include?('condition')

      if valera.send(effect['condition']['name']).between?(effect['condition']['min'], effect['condition']['max'])
        change_attribute(effect['name'], effect['condition']['value'], valera)
      end
    end
  end

  def do_action(action, valera)
    unless action['conditions'].size.zero?
      action['conditions'].each do |condition|
        unless valera.send(condition['name']).between?(condition['min'], condition['max'])
          return "\nПараметр Валеры #{condition['name']} должен быть в промежутке от #{condition['min']} до #{condition['max']}\n"
        end
      end
    end
    change_attributes(action, valera)
    nil
  end
end
