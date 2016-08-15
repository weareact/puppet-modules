#----------------------------------------------------------------------------
#  Copyright (c) 2016 WSO2, Inc. http://www.wso2.org
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#----------------------------------------------------------------------------

define wso2base::patch ($patches_abs_dir, $patches_dir, $user, $group, $product_name, $product_version) {
  file { $patches_abs_dir:
    ensure  => present,
    owner   => $user,
    group   => $group,
    mode    => '0754',
    ignore  => '.svn',
    recurse => 'remote',
    source  => ["puppet:///modules/${product_name}/patches/${patches_dir}"]
  }
}
