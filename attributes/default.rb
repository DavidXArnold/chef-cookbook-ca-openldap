#
# Cookbook Name:: nmd_openldap
# Attribute File:: default
#
# Copyright 2013, Christophe Arguel <christophe.arguel@free.fr>
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

# Default base dn
default.nmd_openldap.basedn = "dc=example,dc=com"

# Default openldap server
default.nmd_openldap.ldap_server = "localhost"

# Default openldap port
default.nmd_openldap.ldap_port = "636"

default.nmd_openldap.db_dir = "/var/lib/ldap"

# Default rootDN (relative to the basedn)
default.nmd_openldap.rootdn = "cn=Manager"

# Default rootPassword, will be stored in SSHA
# It should be overriden by a role attribute
default.nmd_openldap.rootpassword = "pa$$word"

# Default log level of the accesses to the bdb database
default.nmd_openldap.ldap_log_level = "-1"

# Define if encrypted databags are used.
default.nmd_openldap.use_encrypted_databags = :yes

# Define a secondary attribute to store a SHA hashed value of a users password
# If defined a SHA hash will be generated from the supplied password for each
# defined user and placed in this attribute. Typically this is not used.
default.nmd_openldap.user_secondary_passwd_attribute = nil

# Default ACL
default.nmd_openldap.acls = ["to attrs=userPassword by self =xw by anonymous auth by * none",
                            "to * by self write by users read by * none"]

# Default cookbook which defines the schemas to import
# The cookbook shall store these schemas under files/default/schemas/
# Each schema file shall have a .schema extension
default.nmd_openldap.schema_cookbook = nil

# Default additional schemas to import
default.nmd_openldap.additional_schemas = []

# Default DIT to create in the directory.
# This attribute can be overriden by the 'nmd_openldap/dit' data bag item.
# If this data bag item exists, the DIT is searched under the "dit" hash key.
# Each entry of the DIT is defined by an hash, where:
# - the key is the part of the DN relative to its parent
# - the value is a hash including the following keys:
#   - "attrs": hash defining all attributes of the entry
#   - "children": hash of the children entries
default.nmd_openldap.dit = {
  "#{node.nmd_openldap.basedn}" => {
    attrs: {
      objectClass: ["organization", "dcObject"],
      description: "DN description",
      o: "organization"
    },
    children: {
      "ou=users" => {
        attrs: {
          objectClass: %W[top organizationalUnit]
        }
      },
      "ou=groups" => {
        attrs: {
          objectClass: %W[top organizationalUnit]
        }
      },
      "ou=policies" => {
        attrs: {
          objectClass: %W[top organizationalUnit]
        }
      }
    }
  }
}

# Root directory of the openldap configuration
default.nmd_openldap.root_dir = "/etc/openldap"

# Root directory of the slapd configuration
default.nmd_openldap.config_dir = "#{node.nmd_openldap.root_dir}/slapd.d"

# Enable TLS connections, possible values are
# :no TLS access is not allowed
# :yes both clear and TLS accesses are allowed
# :exclusive only TLS access is allowed (ldap_port shall be correctly set)
default.nmd_openldap.tls.enable = :exclusive

# Path of the directory which contains the TLS CA certificates
default.nmd_openldap.tls.cacert_path = "/etc/openldap/cacerts"

# Path of the TLS certificate file
default.nmd_openldap.tls.cert_file = "/etc/openldap/certs/#{node.fqdn}.pem"

# Path of the TLS key file
default.nmd_openldap.tls.key_file = "/etc/openldap/certs/#{node.fqdn}.key"

# Assume the CA certificate, the server certificate and its related key already exist under default directory (/etc/pki/tls for RHEL).
# When this attribute is set to true, the following links are created:
# * node.nmd_openldap.tls.cert_file: points to the Server certificate (/etc/pki/tls/certs/<fqdn>.pem for RHEL)
# * node.nmd_openldap.tls.cacert_path + "/" + cacert_hash + ".0": points to the CA certificate chain (/etc/pki/tls/certs/<hostname>-bundle.crt for RHEL), cacert_hash is the X509 hash of the CA certificate file
# Additionally the key file (/etc/pki/tls/private/<fqdn>.key) is copied to node.nmd_openldap.tls.key_file.
# This attribute is helpfull when certificates are deployed with the _certificate_ cookbook.
default.nmd_openldap.use_existing_certs_and_key = true

# DN of the default ppolicy configuration (relative to basedn)
default.nmd_openldap.ppolicy_default_config_dn = "cn=passwordDefault,ou=policies"

# Default ppolicy configuration (supported attributes are defined by section "Object Class Attributes" in slapo-ppolicy(5))
default.nmd_openldap.ppolicy_default_config = {
  pwdAllowUserChange: "TRUE",
  pwdAttribute: "userPassword",
  pwdCheckQuality: "0",
  pwdMinAge: "0",
  pwdMaxAge: "0",
  pwdMinLength: "5",
  pwdInHistory: "5",
  pwdMaxFailure: "3",
  pwdFailureCountInterval: "0",
  pwdLockout: "TRUE",
  pwdLockoutDuration: "0",
  pwdAllowUserChange: "TRUE",
  pwdExpireWarning: "0",
  pwdGraceAuthNLimit: "0",
  pwdMustChange: "FALSE",
  pwdSafeModify: "TRUE"
}
