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

directory '/opt/tomcat' do
    user 'tomcat'
    group 'tomcat'
    mode  '0755'
    action :create
end

remote_file '/opt/tomcat/apache-tomcat-8.0.43.tar.gz' do
     source 'http://mirror.fibergrid.in/apache/tomcat/tomcat-8/v8.0.43/bin/apache-tomcat-8.0.43.tar.gz'
     action :create
     group 'tomcat'
     owner 'tomcat'
end
     



# end
