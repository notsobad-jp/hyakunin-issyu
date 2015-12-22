class HyakuninIssyu
  class Engine < ::Rails::Engine
    isolate_namespace HyakuninIssyu

    initializer :assets do |config|
      Rails.application.config.assets.paths << root.join("vendor", "assets", "images")
      Rails.application.config.assets.paths << root.join("vendor", "assets", "audios")
    end
  end
end
