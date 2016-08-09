require File.expand_path('../command', __FILE__)

module EPP
  module Domain
    class Info < Command
      def initialize(name, auth_info = {})
        @name = name
        @auth_info = auth_info
      end

      def name
        'info'
      end

      def to_xml
        node = super
        node << domain_node('name', @name)
        node << auth_info_to_xml(@auth_info) unless @auth_info.empty?
        node
      end
    end
  end
end
