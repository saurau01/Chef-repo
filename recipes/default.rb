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

remote_file 'apache-tomcat-8.0.43.tar.gz' do
  source 'http://mirror.fibergrid.in/apache/tomcat/tomcat-8/v8.0.43/bin/apache-tomcat-8.0.43.tar.gz'
  action :create
end

directory '/opt/tomcat' do
    action :create
    owner 'tomcat'
    group 'tomcat'
    mode  '0755'
end

execute 'tar -xvzf apache-tomcat-8.0.43.tar.gz -C /opt/tomcat --strip-components=1'


%w[/opt/tomcat/conf/ /opt/tomcat/webapps/ /opt/tomcat/work/ /opt/tomcat/logs/ /opt/tomcat/temp/].each do |path|
    directory path do
      owner 'tomcat'
      group 'tomcat'
      mode  '0755'
      
    end
end

execute 'chmod -Rf 755 /opt/tomcat'

template '/etc/systemd/system/tomcat.service' do
  source 'tomcat.service.erb'
  mode   '0755'
end

execute 'deamon-reload' do
  command 'systemctl daemon-reload'
  action :nothing
end

service 'tomcat' do
  action [:enable, :start]
end
