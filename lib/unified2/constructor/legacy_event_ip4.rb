require 'unified2/constructor/primitive/ipv4'

#
# Unified2
#
module Unified2

  #
  # Constructor
  #
  module Constructor

    #
    # Legacy Event IP Version 4
    # 
    class LegacyEventIP4 < ::BinData::Record

      endian    :big

      uint32    :sensor_id
      
      uint32    :event_id
      
      uint32    :event_second
      
      uint32    :event_microsecond
      
      uint32    :signature_id
      
      uint32    :generator_id
      
      uint32    :signature_revision
      
      uint32    :classification_id
      
      uint32    :priority_id
      
      ipv4      :ip_source
      
      ipv4      :ip_destination
      
      uint16    :sport_itype
      
      uint16    :dport_icode
      
      uint8     :protocol
      
      uint8     :packet_action
      
    end # class EventIP4

  end # module Constructor

end # module Unified2
