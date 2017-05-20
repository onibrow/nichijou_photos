# Nichijou Photos

A photo booth that uploads to [kuubrow](https://twitter.com/kuubrow)

I used [twurl](https://github.com/twitter/twurl) to upload to my twitter.

First off, I got a developer key from twitter, and authenticated my PINE64.

The get a picture off of the webcam, I used streamer, which was available on the debian repository.

Next, to generate the tweet, I followed documentation on the twurl page. I scrapped the media_id using a small python script, which was then passed to the next command to be uploaded. 

The entire process is then wrapped in a loop waiting for a GPIO.IN from a button using the RPI GPIO library. I have a cron job set up so it runs this at start, so that it works plug 'n play.

A subtle work around was made when I had to execute `sudo python nichijou.py` as root, but twurl was only set up for the user, so I had to make sure those commands were executed explicitly from the user.
