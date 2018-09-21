# README

After install:

* Run the server

* Run ngrok (in the console: ngrok http 3000 )

* Copy the forwarding HTTPS URL 

* Go to twilio.com & Login

* In 'Phone Numbers' section, choose 'Tools' > 'TwiML Apps' > rails-calls

* Paste the previous HTTPS URL in 'REQUEST URL' leaving at the end /call/connect

* Ex. If your copied URL is https://f444b12.ngrok.io, your text field should be
https://f444b12.ngrok.io/call/connect
