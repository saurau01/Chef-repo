#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
package 'java-1.7.0-openjdk-devel'

group 'tomcat'

user 'tomcat' do
     manage_home false
     shell '/bin/nologin'
     group 'tomcat'
     home '/opt/tomcat'
end



# end