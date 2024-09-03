#!/bin/bash

# sysopctl version
VERSION="v0.1.0"

# Function to list running services (Level Easy)
list_services() {
  echo "Listing all active services..."
  systemctl list-units --type=service
}

# Function to display system load (Level Easy)
view_system_load() {
  echo "Current system load averages:"
  uptime
}

# Function to start a service (Level Intermediate)
start_service() {
  if [ -z "$2" ]; then
    echo "Please specify a service name."
    exit 1
  fi
  echo "Starting service: $2"
  sudo systemctl start "$2" && echo "$2 started successfully!"
}

# Function to stop a service (Level Intermediate)
stop_service() {
  if [ -z "$2" ]; then
    echo "Please specify a service name."
    exit 1
  fi
  echo "Stopping service: $2"
  sudo systemctl stop "$2" && echo "$2 stopped successfully!"
}

# Function to check disk usage (Level Intermediate)
check_disk_usage() {
  echo "Checking disk usage by partition..."
  df -h
}

# Function to monitor system processes (Advanced Level)
monitor_processes() {
  echo "Monitoring system processes..."
  top
}

# Function to analyze system logs (Advanced Level)
analyze_logs() {
  echo "Analyzing recent critical log entries..."
  sudo journalctl -p 3 -xb
}

# Function to backup system files (Advanced Level)
backup_files() {
  if [ -z "$2" ]; then
    echo "Please specify the path to backup."
    exit 1
  fi
  echo "Backing up files from $2..."
  rsync -avh --progress "$2" /backup/
  echo "Backup completed!"
}

# Main command handling
case "$1" in
  "service")
    case "$2" in
      "list") list_services ;;
      "start") start_service "$@" ;;
      "stop") stop_service "$@" ;;
      *) echo "Invalid service command. Use list, start <service-name>, or stop <service-name>." ;;
    esac
    ;;

  "system")
    if [ "$2" = "load" ]; then
      view_system_load
    else
      echo "Invalid system command. Use load."
    fi
    ;;

  "disk")
    if [ "$2" = "usage" ]; then
      check_disk_usage
    else
      echo "Invalid disk command. Use usage."
    fi
    ;;

  "process")
    if [ "$2" = "monitor" ]; then
      monitor_processes
    else
      echo "Invalid process command. Use monitor."
    fi
    ;;

  "logs")
    if [ "$2" = "analyze" ]; then
      analyze_logs
    else
      echo "Invalid logs command. Use analyze."
    fi
    ;;

  "backup")
    backup_files "$@"
    ;;

  "--help")
    cat <<EOF
Usage:
  sysopctl [command] [options]

Commands:
  service list                  List running services
  service start <service-name>   Start a specified service
  service stop <service-name>    Stop a specified service
  system load                   Display current system load
  disk usage                    Show disk usage by partition
  process monitor               Monitor system processes in real-time
  logs analyze                  Analyze recent critical log entries
  backup <path>                 Backup system files from the specified path

Options:
  --help                        Show this help message
  --version                     Show version information

EOF
    ;;

  "--version")
    echo "sysopctl $VERSION"
    ;;

  *)
    echo "Invalid command! Use --help for usage information."
    ;;
esac
