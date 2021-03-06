#
# Cookbook Name:: webdev
# Attributes:: default
#
# Copyright 2013-2014, Thomas Boerger <thomas@webhippie.de>
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

default["webdev"]["create_service"] = value_for_platform_family(
  ["debian"] => "update-rc.d %s defaults",
  ["suse"] => "systemctl enable %s.service"
)

default["webdev"]["remove_service"] = value_for_platform_family(
  ["debian"] => "update-rc.d -f %s remove",
  ["suse"] => "systemctl disable %s.service"
)

default["webdev"]["start_service"] = value_for_platform_family(
  ["debian"] => "service %s start",
  ["suse"] => "systemctl start %s.service"
)

default["webdev"]["stop_service"] = value_for_platform_family(
  ["debian"] => "service %s stop",
  ["suse"] => "systemctl stop %s.service"
)

default["webdev"]["restart_service"] = value_for_platform_family(
  ["debian"] => "service %s restart",
  ["suse"] => "systemctl restart %s.service"
)

default["webdev"]["castles"] = {

}

default["webdev"]["config_files"] = %w(
  rails.conf
  symfony.conf
  typo3.conf
  wordpress.conf
)

default["webdev"]["config_dir"] = "/etc/nginx/templates"
default["webdev"]["executable"] = "/usr/local/sbin/webdev"
default["webdev"]["database"]["database"] = "webdev"
default["webdev"]["database"]["username"] = "webdev"
default["webdev"]["database"]["password"] = "webdev"
