require 'pedump'
class Pe
  attr_accessor :pe_dump

  def initialize(file)
    @pe_dump = PEdump.new(file)
  end

  def information
    information_hash = @pe_dump.version_info[0].Children[0].Children[0].Children.pluck('szKey','Value').to_h
    information_hash.each_value(&:strip!)
    {
      description: information_hash['FileDescription'],
      name: information_hash['ProductName'],
      version: information_hash['ProductVersion']
    }

  end

  def pe? 
    @pe_dump.pe?
  end


end