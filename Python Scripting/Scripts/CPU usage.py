import psutil

# Get CPU usage
cpu_usage = psutil.cpu_percent(interval=1)

# Check condition
if cpu_usage > 80:
    print(f"ALERT: High CPU usage detected! Current Usage: {cpu_usage}%")
else:
    print(f"CPU usage is normal: {cpu_usage}%")
