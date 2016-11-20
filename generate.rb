#!/usr/bin/env ruby
require 'awesome_print'
require 'erb'
require 'ostruct'
require 'date'
require 'i18n'
require 'ffi-icu'

I18n.load_path = %w(config/fr.yml)
I18n.default_locale = :fr

events = Dir[File.join 'config', '*.rb'].sort.reverse
events = events.collect do |name|
	event = eval File.read name
	name = File.basename name, '.rb'
	[name, event]
end.to_h

template = ERB.new File.read 'config/template.html.erb'

events.each do |current_event, event|
	next if event[:disabled]
	content = template.result binding
	output = File.join 'source', "#{current_event}.html.erb"
	puts "Generate #{output}"
	File.write output, content
end
