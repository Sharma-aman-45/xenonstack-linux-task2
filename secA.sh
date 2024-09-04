#!/bin/bash

# sysopctl version
VERSION="v0.1.0"

# Display help text
if [ "$1" = "--help" ]; then
  cat <<EOF
Usage:
  sysopctl [options]

Options:
  --help            Show Help Message
  --version         Show Version
  create-manpage    Create the manual page for sysopctl

Description:
  sysopctl is a custom command designed to manage system resources, services, and health on Linux systems.
EOF
  exit 0
fi

# Display version information
if [ "$1" = "--version" ]; then
  echo "sysopctl $VERSION"
  exit 0
fi

# Create a manual page and save it to sysopctl.1
if [ "$1" = "create-manpage" ]; then
  cat <<EOF > sysopctl.1
.TH sysopctl 1 "September 2024" "$VERSION" "Custom System Management Command"
.SH NAME
sysopctl - A custom command for system resource and task management.
.SH SYNOPSIS
sysopctl [options]

.SH DESCRIPTION
sysopctl is a command-line utility designed to manage system services, processes, and overall system health. It provides essential features like service management, system monitoring, and resource analysis.

.SH OPTIONS
.TP
.BR \-\-help
Show help message and usage information.
.TP
.BR \-\-version
Show the current version of sysopctl.
.TP
.BR create-manpage
Generate the manual page for sysopctl.

.SH AUTHOR
Aman

.SH SEE ALSO
systemctl(1), top(1), journalctl(1)
EOF

  echo "Manual page 'sysopctl.1' created successfully!"
  exit 0
fi

# Default message if no valid option is provided
echo "Invalid command or option! Use --help for usage."
exit 1
