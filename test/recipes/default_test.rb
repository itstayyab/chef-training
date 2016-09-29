# # encoding: utf-8

# Inspec test for recipe tomcat::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html
#
#unless os.windows?
#  describe user('root') do
#    it { should exist }
#    skip 'This is an example test, replace with your own test.'
#  end
#end
#
#describe port(80) do
#  it { should_not be_listening }
#  skip 'This is an example test, replace with your own test.'
#end
describe command("ls -l") do
    its(:stdout) { should match /total 0/ }
end

describe package('openjdk-7-jre') do
  it { should be_installed }
end

describe group('tomcat') do
  it { should exist }
end

describe user('tomcat') do
  it { should exist }
end

describe package('tomcat7') do
  it { should be_installed }
end

describe service('tomcat7') do
  it { should be_enabled }
  it { should be_enabled }
end

describe file('/etc/tomcat7/tomcat-users.xml') do
  it { should exist}
  its(:content) { should match /username="admin"/ }
end

#describe file('/etc/default/tomcat') do
#  it { should MATCHER 'JAVA_OPTS' }
#  it { }
#  JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -Xmx512m -XX:MaxPermSize=256m -XX:+UseConcMarkSweepGC"
#end
