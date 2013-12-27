#
# Cookbook Name:: webdev
# Recipe:: default
#
# Copyright 2013, Thomas Boerger
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

include_recipe "nginx"
include_recipe "php"
include_recipe "ruby"
include_recipe "mysql"
include_recipe "postgresql"
include_recipe "mongodb"
include_recipe "memcached"
include_recipe "elasticsearch"
include_recipe "redis"

directory node["webdev"]["config_dir"] do
  owner "root"
  group "root"
  mode 0640
  recursive true

  action :create
end

node["webdev"]["config_files"].each do |name|
  template ::File.join(node["webdev"]["config_dir"], name) do
    source "#{name}.erb"
    owner "root"
    group "root"
    mode 0644

    variables(
      node["webdev"]
    )
  end
end

template node["webdev"]["executable"] do
  source "executable.erb"
  owner "root"
  group "root"
  mode 0744

  variables(
    node["webdev"]
  )
end

mysql_app node["webdev"]["database"]["database"] do
  username node["webdev"]["database"]["username"]
  password node["webdev"]["database"]["password"]

  action :create
end

postgresql_app node["webdev"]["database"]["database"] do
  username node["webdev"]["database"]["username"]
  password node["webdev"]["database"]["password"]

  action :create
end

mongodb_app node["webdev"]["database"]["database"] do
  username node["webdev"]["database"]["username"]
  password node["webdev"]["database"]["password"]

  action :create
end
