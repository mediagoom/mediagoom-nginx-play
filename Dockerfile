FROM nginx:mainline

RUN echo "add_header 'Access-Control-Allow-Origin' '*';\n\
          types {\n\
	  		application/dash+xml     mpd;\n\
			application/vnd.apple.mpegurl    m3u8;\n\
	  }" > /etc/nginx/conf.d/cors.conf 


