# CHANGELOG for nmd-openldap

This file is used to list changes made in each version of nmd_openldap.
## 0.3.8:
* fixed additional typo and missed encrypted databag logic in server recipe.

## 0.3.7:
* fixed typo.

## 0.3.6:
* Renamed nmd_openldap to nmd-openldap to fix issues with underscore.

## 0.3.5:
* Added support to toggle bewteen encrypted and non-encrypted databags.  Added support for secondary password attribute.

## 0.3.4:
* moved root pwd to databag

## 0.3.3:
* Fixed more typos from rename

## 0.3.2:
* Fixed a typo from rename and move databags to use only encrypted  

## 0.3.1:
* added kitchen support, self signed recipe, moved and renamed to nmd-openldap.

## 0.2.1:

* Fix #2: Compile Error in server recipe on file resource node.nmd_openldap.tls.key_file
* Fix #1: Wrong rootdn used for the ppolicy configuration creation

## 0.2.0:

* Add TLS support based on the certificates and the related key file 
previously deployed by the _certificate_ cookbook (see attribute `use_existing_certs_and_key`)
* Improve the documentation (see README.md)

## 0.1.0:

* Initial release of nmd_openldap

- - -
Check the [Markdown Syntax Guide](http://daringfireball.net/projects/markdown/syntax) for help with Markdown.

The [Github Flavored Markdown page](http://github.github.com/github-flavored-markdown/) describes the differences between markdown on github and standard markdown.
