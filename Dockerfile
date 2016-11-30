FROM nginx:mainline

RUN echo "add_header 'Access-Control-Allow-Origin' '*';\n\
          types {\n\
	  		application/dash+xml     mpd;\n\
	  }" > /etc/nginx/conf.d/cors.conf \
	  && apt-get update \
	  && apt-get install --no-install-recommends --no-install-suggests -y \
	  			curl \
				git  \
&& curl -o /tmp/mg.latest.tar.gz http://mediagoom.com/assets/mg.latest.tar.gz \ 
&& tar -C /tmp -xvzf /tmp/mg.latest.tar.gz  \
&& mv /tmp/bitbucket/release/src/mgcli/mg /usr/local/bin/mg \
&& rm -rf /var/lib/apt/lists/* \
&& rm -rf /tmp/* \
&& git clone https://github.com/mediagoom/Play.git /usr/share/nginx/html/play
