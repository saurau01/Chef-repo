# # encoding: utf-8

# Inspec test for recipe tomcat::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

#unless os.windows?
  # This is an example test, replace with your own test.
 # describe user('root'), :skip do
  #  it { should exist }
 # end
#end

# This is an example test, replace it with your own test.
#describe port(8080), do
 # it { should_not be_listening }
#end

describe command('curl localhost:8080') do
  its('stdout') { should match (/Tomcat/) }
end
describe package ('java-1.7.0-openjdk-devel') do
  it { should be_installed }
end
describe file ('/opt/tomcat') do
  it {should be_directory}
  it { should be_owned_by 'tomcat'}
end

describe user ('tomcat') do
  it {should exist}
  its ('group') {should eq 'tomcat'}
  its ('home') {should eq '/opt/tomcat'}
  its ('shell') {should eq '/bin/nologin'}

end
describe group('tomcat') do
  it {should exist}
end
describe service('tomcat') do
  it {should be_installed}
  it {should be_enabled}
  it {should be_running}
end