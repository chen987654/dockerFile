FROM alpine:3.20.2

RUN apk add --no-cache \
	subversion==1.14.3-r2 \
	wget==1.24.5-r0

EXPOSE 3690

CMD [ "/usr/bin/svnserve", "--daemon", "--foreground", "--root", "/var/opt/svn" ]

VOLUME [ "/var/opt/svn" ]
WORKDIR /var/opt/svn

RUN svnadmin create svn 
RUN chmod -R 775 svn/db
#RUN cd svn/conf/ 
COPY svnserve.conf svn/conf/
COPY passwd svn/conf/
COPY authz svn/conf/
