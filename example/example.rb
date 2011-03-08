$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'unified2'
require 'pp'

# Unified2 Configuration
Unified2.configuration do
  
  # # Sensor Configurations
  sensor :id => 200, :name => 'Hello Sensor', :interface => 'en1'
  
  # Load signatures into memory
  load :signatures, '/Users/dustinwebber/.snort/etc/sid-msg.map'
  load :generators, '/Users/dustinwebber/.snort/etc/gen-msg.map'
  
end

# Unified2#watch will continuously monitor
# the unified output for modifications and
# process the data accordingly.
Unified2.read('/var/log/snort/merged.log') do |event|
  next if event.signature.name.blank?
  
  puts "#{event.sensor.id} #{event.source_port} #{event.destination_port} #{event.protocol}"
  
  # puts "#{event.id} | #{event.ip_destination} | #{event.ip_source} | #{event.signature.name}"
  # {event.generator_id} || #{event.signature.id}
end

# Unified2#read will parse the supplied
# unified2 output and return records untill EOF.

# @signatures = []
# 
# Unified2.read('/var/log/snort/merged.log', :limit => 5000) do |event|
#   next if @signatures.include?(event.signature.id)
#   @signatures.push event.signature.id
#   
#   puts "#{event.id} | #{event.ip_destination} | #{event.ip_source} | #{event.signature.name}"
#   
# end