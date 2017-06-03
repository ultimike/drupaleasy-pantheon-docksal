DrupalEasy Pantheon-flavored Docksal Configuration
==================================================

A complete Docksal configuration for working with Pantheon-powered sites. 

## Includes

*  Solr 3.x container  
*  Dev version of PHP 7 CLI container.  
*  "web" docroot directory (works with https://github.com/pantheon-systems/example-drops-8-composer).  
*  Empty php.ini file (ready for customization).  
*  "fin init" command that reset the local environment, creates and downloads (using Terminus) a new database backup from Pantheon, and (optionally) enables development-related modules in the local environment.  
*  "fin downloaddb" command that creates and downloads (using Terminus) a new database backup from Pantheon, and (optionally) enables development-related modules in the local environment.  
*  (Commented out) support for xdebug in the docksal-local.yml file.  

## Prerequisites  

*  Docksal (http://docksal.io/).  
*  Terminus (https://pantheon.io/docs/terminus/).  
*  A Pantheon account (https://pantheon.io/).  

## Possible future enhancements  

*  nginx web container  
*  Ability to pass in Pantheon "environment" variable for downloading database backups from a specific environment (scripts currently set to download from "dev").  

## Instructions for use

*  Install Docksal (http://docksal.readthedocs.io/en/master/getting-started/setup/).  

*  Create a "database_dumps" directory in your project root.

*  Rename this repository from `drupaleasy_pantheon-docksal` to `.docksal` and place in the root of your project so that it is a sibling of your web docroot. For example:

```
/project_root/.docksal/
/project_root/database_dumps/
/project_root/web/{{all the Drupal}}
```

*  Run `fin start` (see http://docksal.readthedocs.io/en/master/getting-started/project-setup/).  
