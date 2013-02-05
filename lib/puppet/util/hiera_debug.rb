module Hieradebugger
  class Util

  	def self.debug(lookup,lookscope,runid,arguments,certname)
  		self.writeheader(runid,certname)
  		self.writeitem(lookscope,arguments,lookup,certname)
  	end

  	def self.writeitem(lookscope,arguments,value,certname)
  		filename = self.filename(certname)
  		item = {:lookscope => lookscope, :variablename => arguments[0], :default => arguments[1], :value => value}
  		File.open(filename, 'a') {|f| f.puts(item.inspect) }
  	end

  	def self.writeheader(runid,certname)
  		filename = self.filename(certname)
  		version = {:version => runid}
      if File.exist?(filename)
        File.open(filename, 'r') {|f| 
          while (line = f.gets)
            if line =~ /\{:version=>#{runid}/
              return
            end
          end
        }
      end
  		File.open(filename, 'w') {|f| f.puts(version.inspect) }
  	end

  	def self.filename(certname)
  		return "#{Puppet.settings[:logdir]}/hiera_debug_#{certname}"
  	end

  end
end