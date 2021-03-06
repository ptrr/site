###
# Compass
###

set :index_file, "home.html"

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page "*", :layout => :layout
page "/en.html", layout: :en_layout
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :layout do
#   page "/home.html"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  
  activate :directory_indexes
  # set :http_prefix, "/Content/images/"
end

activate :deploy do |deploy|
  deploy.method = :rsync
  deploy.host   = 'ikbenmanus.nl'
  deploy.path   = '/var/www/manus'
  # Optional Settings
  deploy.user  = 'www-data' # no default
  # deploy.port  = 5309 # ssh port, default: 22
  deploy.clean = true # remove orphaned files on remote host, default: false
  # deploy.flags = '-rltgoDvzO --no-p --del' # add custom flags, default: -avz
end
