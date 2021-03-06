# Provides a "random" value to cron based on the passed integer value.
# Used to avoid starting a certain cron job at the same time on all
# servers.  If used with no parameters, it will return a single value between
# 0-59 first argument is the occurrence within a timeframe, for example if you
# want it to run 2 times per hour the second argument is the timeframe, by
# default its 60 minutes, but it could also be 24 hours etc
#
# Pulled from: http://projects.puppetlabs.com/projects/puppet/wiki/Cron_Patterns/8/diff
# Author: ohadlevy@gmail.com
# License: Apache License, Version 2.0
#
# example usage
# ip_to_cron()     - returns one value between 0..59
# ip_to_cron(2)    - returns an array of two values between 0..59
# ip_to_cron(2,24) - returns an array of two values between 0..23

module Puppet::Parser::Functions
  newfunction(:ip_to_cron, :type => :rvalue) do |args|
    Puppet::Parser::Functions.autoloader.loadall
    function_rand_cron([lookupvar('::ipaddress'),args[0],args[1]])
  end
end

