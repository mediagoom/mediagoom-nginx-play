### mediagoom-nginx-play
Repository for the mg Docker image

# Usage
In order to start a docker with mg use the following command:
`docker run -i -t  --name mg -p 80:80 mediagoom/nginx-play /bin/bash`
in case you do not want to make your docker web site available to the outside world
just remove `-p 80:80`.

If you want to be able to exchange files with your docker you can use the following 
command to share the /tmp dir.

`docker run -i -t  --name mg -v /tmp:/tmp -p 80:80 mediagoom/nginx-play /bin/bash`


Once your docker start just run `mg --help` to make sure everything is ready to go.

Now you can start producing and play your media.

For instance use this script to download some ready files and publish them in mpeg-dash:


	cat <<EOF > dash.sh 
	#!/bin/bash
	dash()
	{
	## declare an array variable
	declare -a arr=(                      \\
	'bbb_1024x576_h264-750Kb_aac-lc.mp4'  \\
	'bbb_1280x720_h264-1200Kb_aac-lc.mp4' \\
	'bbb_1280x720_h264-2000Kb_aac-lc.mp4' \\
	'bbb_1280x720_h264-3500Kb_aac-lc.mp4' \\
	'bbb_512x288_h264-320Kb_aac-lc.mp4'   \\
	'bbb_256x144_h264-120Kb_aac-lc.mp4'   \\
	)
	declare -a br=('750' '1200' '2000' '3500' '320' '120')
	l=\${#arr[@]}
	ou="/usr/share/nginx/html/dash"
	if [ -d "\$ou" ]; then rm "\$ou/*"; else mkdir \$ou; fi
	cmd="-k:ssf -o:\$ou"
	for (( c=0; c<\$l; c++ ))
	do  
	if [ "\$c" == "0" ]; then cmd+=" -s:0 -e:0 -i:"; else cmd+=" -j:"; fi
	cmd+="\${arr[\$c]}";
	cmd+=" -b:\${br[\$c]}";
	done
	mg \$cmd
	}
	url=https://dl.dropboxusercontent.com/u/33964970/bbb2.tar
	if [ -e "bbb.tar" ]
		then 
			echo "tar exist";
			dash
		else 
			curl --keepalive-time 2 -o bbb.tar \$url 
			if [ 0 -eq \$? ]; then 
				tar xvf bbb.tar; 
				dash
			else 
				"curl failed"; 
			fi 
	fi
	EOF
	chmod +x dash.sh


Then run `./dash.sh`

When mg finish you can start nginx to server your content: `nginx -g 'daemon off;'`

Then point your browser to `http://<container ip or localhost>/play/index.html?src=/dash` to play your content in mpeg-dash.

