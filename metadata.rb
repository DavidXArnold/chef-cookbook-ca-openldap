name 'nmd-openldap'
maintainer 'NewMedia! Denver'
maintainer_email 'support@newmediadenver.com'
license 'Apache 2.0'
description 'Configures a node to be an OpenLDAP server or client.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.3.9'
supports 'redhat', '>= 6.0'
supports 'centos', '>= 6.0'

nmd_openldap_desc = 'This is the openldap Cookbook for New Media Denver'
nmd_openldap_desc << 'This cookbook provides several recipes to perform the '
nmd_openldap_desc << 'following actions: '
nmd_openldap_desc << '* configure a node to be an OpenLDAP server or OpenLDAP'
nmd_openldap_desc << '* import specific schemas,'
nmd_openldap_desc << '* create a DIT,'
nmd_openldap_desc << '* configure the PPolicy module'
nmd_openldap_desc << '* enable TLS support'
nmd_openldap_desc << '* populate the directory.'
nmd_openldap_desc << 'This cookbooks only supports OpenLDAP 2.4+, as it is '
nmd_openldap_desc << 'based on the new on line configuration method.'

long_description nmd_openldap_desc
