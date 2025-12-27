#!/usr/bin/env bash

set -e

SERVICE_PATH="/etc/systemd/system/night-suspend.service"
TIMER_PATH="/etc/systemd/system/night-suspend.timer"

echo "Creating systemd service..."

sudo tee "$SERVICE_PATH" > /dev/null << 'EOF'
[Unit]
Description=Suspend system overnight with wake alarm

[Service]
Type=oneshot
ExecStart=/bin/bash -c '\
  echo 0 > /sys/class/rtc/rtc0/wakealarm; \
  echo "$(date -d "07:00 tomorrow" +%s)" > /sys/class/rtc/rtc0/wakealarm; \
  systemctl suspend'
EOF

echo "Creating systemd timer..."

sudo tee "$TIMER_PATH" > /dev/null << 'EOF'
[Unit]
Description=Suspend system every night at 10:45 PM

[Timer]
OnCalendar=*-*-* 22:45:00
Persistent=true

[Install]
WantedBy=timers.target
EOF

echo "Reloading systemd..."
sudo systemctl daemon-reload

echo "Enabling and starting timer..."
sudo systemctl enable --now night-suspend.timer

echo
echo "✅ Setup complete!"
echo "The system will suspend every night at 10:45 PM and wake at 7:00 AM."
echo
echo "To verify:"
echo "  systemctl list-timers | grep night-suspend"
