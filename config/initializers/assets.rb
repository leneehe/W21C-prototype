# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add vendor paths
Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets')

# Precompile core stylesheets
Rails.application.config.assets.precompile += [
  "stylesheets/bootstrap.css",
  "stylesheets/appwork.css",
  "stylesheets/theme-corporate.css",
  "stylesheets/colors.css",
  "stylesheets/uikit.css",
  "libs/smartwizard/smartwizard.css",
]

#Precompile Landing page Stylesheets
Rails.application.config.assets.precompile += [
  "bootstrap.min.css",
  "owl.carousel.min.css",
  "themify-icons.css",
  "animate.css",
  "magnific-popup.css",
  "space.css",
  "theme.css",
  "overright.css",
  "normalize.css",
  "style.css",
  "responsive.css"
  ]

# Precompile core javascripts
Rails.application.config.assets.precompile += ['javascripts/*.js']

# Precompile Landing page javascripts
Rails.application.config.assets.precompile += [
  "vendor/*.js",
  "*.js",
  ]

# Precompile fonts
Rails.application.config.assets.precompile += ['fonts/*']

# Precompile libs
lib_files = Dir[Rails.root.join('vendor', 'assets', 'libs', '**', '[^_]*.*')]
lib_files.map! { |file| file.sub(%r(#{Rails.root.join('vendor', 'assets/')}), '') }
lib_files.map! { |file| file.sub(%r(\.(scss)), '.css') }
Rails.application.config.assets.precompile += lib_files

# Precompile pages
Rails.application.config.assets.precompile += ['stylesheets/pages/*.css']

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )


Dir.glob("#{Rails.root}/app/assets/images/").each do |path|
  Rails.application.config.assets.paths << path
end
