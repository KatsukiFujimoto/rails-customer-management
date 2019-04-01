require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Baukis
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # このアプリケーションのタイムゾーンを東京に設定（時刻を日本時間で表示するため）
    config.time_zone = 'Tokyo'

    # 複数のロケールファイルを読み込み可能に変更（config/localesディレクトリ以下を再帰的に読み込むため）
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb.yml}').to_s]

    # デフォルトのlocaleを日本語にする
    config.i18n.default_locale = :ja

    # 自動Generatorをカスタマイズ
    config.generators do |g|
      g.helper false
      g.assets false
      g.test_framework :rspec
      g.controller_specs false
      g.view_specs false
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
