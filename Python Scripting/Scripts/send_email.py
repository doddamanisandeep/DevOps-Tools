import smtplib

# Email details
sender_email = "your_email@gmail.com"
receiver_email = "receiver_email@gmail.com"
password = "your_password"

# Email message
message = """\
Subject: Reminder: Daily Check-in

Hello, this is your daily reminder to complete your tasks!
"""

# Sending email
try:
    with smtplib.SMTP("smtp.gmail.com", 587) as server:
        server.starttls()
        server.login(sender_email, password)
        server.sendmail(sender_email, receiver_email, message)
    print("Reminder email sent successfully!")
except Exception as e:
    print(f"Failed to send email: {e}")
