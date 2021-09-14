
class PortableExecutable < ApplicationRecord
  has_one_attached :file

  def self.already_uploaded? information
    puts "^" * 100
    puts information
    pe = PortableExecutable.where(name: information[:name], description: information[:description], version: information[:version]).first
  end
  
  def recieved_again
    increment!(:upload_count)
  end

end
