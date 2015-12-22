# Nifi
This cookbook installs Nifi v0.4.0. For more details on Nifi installation, usage, and configuration best practices, check out the [Nifi Administration Guide](https://nifi.apache.org/docs/nifi-docs/html/administration-guide.html).

## Requirements
### depends

### Platforms
- Debian/Ubuntu

### Chef
- Chef 11+

## Attributes
- `node['nifi']['package_url']` - download URL for nifi package
- `node['nifi']['version']` - Nifi version number, current is 0.4.0
- `node['java']['jdk_version']` - Java Version to install, default is 7

## Usage
`include_recipe 'nifi::default'` to install java and nifi, or `include_recipe 'nifi::server` if you'd prefer to install java another way. Alternatively, you can install another version of java by overriding `node['java']['jdk_version']`. The minimum version of Java required by Nifi is 7.

## Recipes
### default
Installs Java and server recipes.

### java
Updates apt, includes java::default recipe.

### server
Uses ark to install, enable, and start nifi; default nifi install directory is /opt/nifi.


### _sysctl
Sets Nifi recommended TCP settings and turns off swap for Ubuntu.

### _limits
Sets maximum file handles and forked processes.

## Authors
* Mercedes Coyle (<me@mercedescoyle.com>)
