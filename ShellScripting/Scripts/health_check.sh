#!/bin/bash

# Email to send the report
EMAIL="sandeepdoddamani7@gmail.com"

# Temp file for report
REPORT="/tmp/ec2_health_report.txt"
> $REPORT

echo "EC2 Health Check Report - $(date)" > $REPORT
echo "----------------------------------" >> $REPORT

# Get a list of all running EC2 instance IDs
INSTANCE_IDS=$(aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[*].Instances[*].InstanceId" --output text)

# Counters for different health issues
OOM_COUNT=0
CPU_HIGH_COUNT=0
OTHER_ISSUES=0

for INSTANCE in $INSTANCE_IDS; do
    echo "Checking instance: $INSTANCE"

    # Check CPU utilization (if > 80%)
    CPU_UTILIZATION=$(aws cloudwatch get-metric-statistics --namespace AWS/EC2 --metric-name CPUUtilization --dimensions Name=InstanceId,Value=$INSTANCE --statistics Average --period 300 --start-time $(date -u -d '5 minutes ago' +%Y-%m-%dT%H:%M:%SZ) --end-time $(date -u +%Y-%m-%dT%H:%M:%SZ) --query "Datapoints[*].Average" --output text | awk '{print int($1)}')

    # Check Memory utilization (requires CloudWatch Agent) - Placeholder
    MEMORY_UTILIZATION=70  # Example: Assume 70% for now

    # Check if CPU is above threshold
    if [[ $CPU_UTILIZATION -gt 80 ]]; then
        echo "Instance $INSTANCE has HIGH CPU usage ($CPU_UTILIZATION%)" >> $REPORT
        ((CPU_HIGH_COUNT++))
    fi

    # Check if Memory is above threshold (assumed logic)
    if [[ $MEMORY_UTILIZATION -gt 85 ]]; then
        echo "Instance $INSTANCE is OUT OF MEMORY ($MEMORY_UTILIZATION%)" >> $REPORT
        ((OOM_COUNT++))
    fi
done

# Summary
echo "" >> $REPORT
echo "Summary:" >> $REPORT
echo "High CPU Usage Instances: $CPU_HIGH_COUNT" >> $REPORT
echo "Out of Memory Instances: $OOM_COUNT" >> $REPORT
echo "Other Issues: $OTHER_ISSUES" >> $REPORT

# Send email report
cat $REPORT | mail -s "Daily EC2 Health Report" $EMAIL

echo "Health check completed. Report sent to $EMAIL."
