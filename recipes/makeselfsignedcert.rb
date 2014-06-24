#
# Cookbook Name:: nmd-openldap
# Recipe File:: makeselfsignedcerts
#
# Copyright 2014, David Arnold <david@newmediadenver.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

execute "certgen" do
  command "openssl req -newkey rsa:2048 -x509 -nodes -out \
  /etc/pki/tls/certs/#{node.fqdn}.pem \
  -keyout /etc/pki/tls/private/#{node.fqdn}.key -days 365 -batch"
  action :run
end
