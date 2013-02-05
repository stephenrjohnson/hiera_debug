Hiera Debug Functions
====================================

I wrote a very simple wrapper function for hiera that will output debug
information into $logidr/hiera_debug_stephensmacbook.

This includes the scope of the hiera call the default value and the value
actually found. 

Usage Functions
---------------

If you want to find out what hiera is doing when looking up values simple
change all hiera function calles to heira_debug, hiera_debug_array,
hiera_debug_hash, hiera_debug_include.

Example manifest 

    $test = hiera_debug('wibble','default')
    $test2 = hiera_debug('wibble2',['1','2','3'])
    $test3 = hiera_debug_array('wibble2','default')
    $test4 = hiera_debug_hash('wibble2',{ key1 =>  val1, key2 => val2})

example logfile

    {:version=>2228119500}
    {:default=>"default", :value=>"default", :variablename=>"wibble", :lookscope=>"main"}
    {:default=>["1", "2", "3"], :value=>["10", "11", "12"], :variablename=>"wibble2", :lookscope=>"main"}
    {:default=>"default", :value=>"default", :variablename=>"wibble2", :lookscope=>"main"} 
    {:default=>{"key1"=>"val1", "key2"=>"val2"}, :value=>{"key1"=>"val1", "key2"=>"val2"}, :variablename=>"wibble2", :lookscope=>"main"}
