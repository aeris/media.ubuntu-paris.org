set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

activate :deploy do |deploy|
	deploy.method       = :rsync
	deploy.host         = 'media.ubuntu-paris.org'
	#deploy.port         = 22
	deploy.path         = '/srv/www/ubuntu-paris.org/media'
	deploy.build_before = true
end

compass_config do |config|
	config.output_style = :compact
end

configure :development do
	activate :livereload, no_swf: true
end

# Build-specific configuration
configure :build do
	activate :minify_css
	activate :minify_javascript
end
