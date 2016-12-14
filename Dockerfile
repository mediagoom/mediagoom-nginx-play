FROM nginx:mainline

RUN echo "add_header 'Access-Control-Allow-Origin' '*';\n\
          types {\n\
	  		application/dash+xml     mpd;\n\
	  }" > /etc/nginx/conf.d/cors.conf \
	  && apt-get update \
	  && apt-get install --no-install-recommends --no-install-suggests -y \
	  			curl \
				git  \
&& curl -O https://github.com/mediagoom/mg/releases/download/mg-travis-0.0.2/mg \ 
&& chmod +x mg  \
&& mv ./mg /usr/local/bin/mg \
&& rm -rf /var/lib/apt/lists/* \
&& git clone https://github.com/mediagoom/Play.git /usr/share/nginx/html/play
