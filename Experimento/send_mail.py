import smtplib
import sys

mail_from = "mail_from"
mail_to = ["mail_to"]
#subject = 'Experimento TCC2'
#msg = 'Todos os experimentos foram finalizados!'

subject = sys.argv[1]
msg = sys.argv[2]

server = smtplib.SMTP("smtp.gmail.com:587")
server.ehlo()
server.starttls()

server.login(mail_from, "email password")
message = 'Subject: {}\n\n{}'.format(subject, msg)
server.sendmail(mail_from, mail_to, message)
server.quit()
