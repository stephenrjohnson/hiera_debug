require 'puppet/parser/files'
require File.expand_path('../../../util/hiera_debug', __FILE__)

module Puppet::Parser::Functions
  newfunction(:hiera_debug_include, :type => :rvalue, :doc => <<-EOS
                wrapper around hiera to allow for writting info to file
              EOS
             ) do |arguments|
  	        	Puppet::Parser::Functions.autoloader.load(:hiera_include) unless Puppet::Parser::Functions.autoloader.loaded?(:hiera_iclude)
  	        	debug("Calling hiera")
            	lookup = function_hiera_include(arguments)
            	debug("Calling hiera_debug")
            	lookscope = resource.name.to_s.downcase
            	runid = catalog.object_id
            	certname = lookupvar('::clientcert')
            	Hieradebugger::Util.debug(lookup,lookscope,runid,arguments,certname)
            	return lookup
             end
end