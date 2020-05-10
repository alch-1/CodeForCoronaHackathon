# CodeForCoronaWinners

## Inspiration

Mental healthcare in Singapore has long been stigmatized by society. Seeking a change in the status quo, nominated member of parliament, Anthea Ong, released a budget statement earlier this year, challenging the Singapore government to take bold steps to revolutionize Singapore’s mental health landscape, “as he has done spectacularly with economic well-being”. She also released a report on her website, sgmentalhealthmatters.com, highlighting the current accessibility, affordability, and quality issues surrounding the mental health community. 

Looking at the problems at hand, our team decided to dive deeper into the biggest issue out of the three, accessibility. We identified a gap in the distribution, supply, and diversity of options available, and sought to brainstorm innovative tech-solutions to address each of them. 

Additionally, with the COVID-19 situation slated to last at least another year in some reports, we believe it is prudent for the government to plan ahead for the future, given how mental health is affected by various facets of life. The world is set for the greatest economic recession since the great depression, foreshadowing the loss of many jobs. Stay-at-home orders and the lack of freedom affects people’s emotional well-being. These concerns could push people’s stress and anxiety levels past their breaking point, highlighting the need for extra focus in this area in the upcoming months.

## What it does

We built a full-stack application for mental health practitioners and those who are seeking mental health. The app is suitable for both crisis users who need immediate medical attention and for those who already have existing appointments with mental health practitioners. 

It features accounts management for both users and therapists, a user UI including a questionnaire feature to direct those who need help to the most relevant hotlines and/or our chatting service, a video call/voice call functionality, a real-time chat functionality, and a management UI including a one-stop page for therapists to view their upcoming appointments.

## How I built it

We built the full-stack web application using: 
Jinja (templating language for Flask), CSS, JavaScript and HTML for our front-end, 
JavaScript and Python (Flask) for our back-end, and 
MySQL for our database. 

To implement real-time chat, we used Flask’s SocketIO library to enable low latency bi-directional communications between the clients and the server. 

To implement video calling, we made use of the OpenTok library by Vonage, which allowed us to generate sessions and tokens to be used for the OpenTok applications. The video calling interface itself was implemented in JavaScript.

## Challenges I ran into

The video call implementation proved to be the most challenging, and after much searching we decided on OpenTok’s free and flexible API. To facilitate situations where the user only wanted to call without video streaming, we had to get creative and code out a button to disable the camera.

Coming up with a salient questionnaire was also difficult, but thanks to our members’ experience with volunteering, we were able to pull through.

## Accomplishments that I'm proud of

We are proud of being able to deliver a robust and functioning full-stack application within the timespan of roughly 1 and a half days, as well as being able to contribute to Singapore’s mental health ecosystem and facilitate mental health care for both ends of the spectrum (users and practitioners).

## What I learned

We learned the importance of teamwork, having a strong fighting spirit and perseverance, as for most of us, this was our first hackathon. We also learned that with a strong vision, we would have the perseverance to press on and continue building our app to perfection.

## What's next for Serenity

There are certain features that we could not practically build within 24 hours. But here are some improvements that could be made to allow our app to be used even beyond COVID-19

Improved language scalability
This website could have an option to change language to Chinese or Malay to allow individuals from different backgrounds to call different hotlines in their native languages. 

Expand to include peer support platforms and allied health services.
We can expand our services to groups such as TCM, physiotherapy and peer support groups in schools that were affected by the circuit breaker, such that they can extend their services online. 

Integrating into the existing government database
We can integrate this system into the existing government database to provide better security for its users and professionals, where users would have to log in to their singpass or provide a form of authentication to attend sessions with professionals. 

Making use of the National Digital Identity (NDI) API
To better improve security, we would make use of the NDI API to build an efficient, secure and transparent ecosystem by allowing authenticate users and verify their identities, as well as preventing people from misusing the website.

SSL/TLS security (HTTPS)
If we had more time, we would sign a certificate under a trusted authority to allow for HTTPS communications, ensuring all incoming and outgoing data is encrypted, maintaining confidentiality of data. 

Deployment on the cloud
To enable scalability of computing power, we would deploy our app on the cloud, for instance on AWS, to allow for greater flexibility and the ability to load balance our instances to ensure high uptime.



