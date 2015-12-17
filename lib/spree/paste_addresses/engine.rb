module Spree
  module PasteAddresses
    class Engine < Rails::Engine
      isolate_namespace Spree
      engine_name "solidus_paste_addresses"

      config.generators do |g|
        g.test_framework :rspec
      end

      def self.activate
        if Spree::PasteAddresses::Engine.backend_available?
          Rails.application.config.assets.precompile += [
              'lib/assets/javascripts/spree/backend/solidus_paste_addresses.js',
              'lib/assets/stylesheets/spree/backend/solidus_past_addresses.css'
          ]
          Dir.glob(File.join(File.dirname(__FILE__), "../../controllers/backend/*/*/*_decorator*.rb")) do |c|
            Rails.configuration.cache_classes ? require(c) : load(c)
          end
        end
      end

      def self.backend_available?
        @@backend_available ||= ::Rails::Engine.subclasses.map(&:instance).map{ |e| e.class.to_s }.include?('Spree::Backend::Engine')
      end

      if self.backend_available?
        paths["app/views"] << "lib/views/backend"
      end

      config.to_prepare &method(:activate).to_proc
    end
  end
end