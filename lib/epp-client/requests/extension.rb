require File.expand_path('../abstract', __FILE__)

module EPP
  module Requests
    class Extension < Abstract
      def initialize(*extensions)
        raise ArgumentError, "you must provide at least one extension" if extensions.compact.empty?
        @extensions = extensions.compact
      end

      def name
        'extension'
      end

      def to_xml
        node = super

        Array(@extensions).each do |extension|
          next if extension.nil?
          extension.set_namespaces(@namespaces) if extension.respond_to?(:set_namespaces)
          node << as_xml(extension)
        end

        node
      end
    end
  end
end
