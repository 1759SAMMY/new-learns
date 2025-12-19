#!/bin/bash
# ============================================================================
# WebSphere Application Server Backup Script
# Author: [Chiemela Okorie]
# Description: Creates a backup of the WebSphere configuration using
#              backupConfig.sh. Supports timestamped backups and logging.
# ============================================================================

# -------------------------
# CONFIGURATION PARAMETERS
# -------------------------
WAS_HOME="/opt/IBM/WebSphere/AppServer"   # Path to WebSphere installation
BACKUP_DIR="/opt/was_backups"              # Directory to store backups
LOG_FILE="/var/log/was_backup.log"         # Log file path

# -------------------------
# FUNCTIONS
# -------------------------

log() {
    local msg="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $msg" | tee -a "$LOG_FILE"
}

error_exit() {
    log "ERROR: $1"
    exit 1
}

# -------------------------
# VALIDATION
# -------------------------
if [[ ! -d "$WAS_HOME/bin" ]]; then
    error_exit "Invalid WAS_HOME: $WAS_HOME"
fi

if [[ ! -x "$WAS_HOME/bin/backupConfig.sh" ]]; then
    error_exit "backupConfig.sh not found or not executable in $WAS_HOME/bin"
fi

mkdir -p "$BACKUP_DIR" || error_exit "Failed to create backup directory: $BACKUP_DIR"

# -------------------------
# BACKUP PROCESS
# -------------------------
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
BACKUP_FILE="$BACKUP_DIR/was_backup_${TIMESTAMP}.zip"

log "Starting WebSphere backup..."
log "Backup file: $BACKUP_FILE"

# Run backupConfig.sh
"$WAS_HOME/bin/backupConfig.sh" "$BACKUP_FILE" -nostop
if [[ $? -ne 0 ]]; then
    error_exit "backupConfig.sh failed."
fi

log "Backup completed successfully."
log "Backup stored at: $BACKUP_FILE"
