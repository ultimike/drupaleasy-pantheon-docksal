#!/usr/bin/env bash

## Enable Drupal modules - normally called right after a database import.
##
## Usage: this function is included in various custom fin commands via:
## source "${PROJECT_ROOT}/.docksal/commands/common/enable_modules.sh"

# Enable modules for local development
enable_modules ()
{
	cd $DOCROOT_PATH

  # Ensure any modules to be enabled are in the local codebase otherwise Drush will download 
  #   them and Composer won't know about them!
	#fin exec "drush en -y stage_file_proxy environment_indicator reroute_email"
}
