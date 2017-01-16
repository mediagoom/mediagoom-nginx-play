### mediagoom-nginx-play
Repository for the mg Docker image

# Usage
In order to start a docker with mg use the following command:
`docker run -i -t  --name mg -p 80:80 mediagoom/nginx-play /bin/bash`
in case you do not want to make your docker web site available to the outside world
just remove `-p 80:80`.

If you want to be able to exchange files with your docker you can use the following 
command to share a dir.

`docker run -i -t  --name mg -v /<yourdir>:/mgdir -p 80:80 mediagoom/nginx-play /bin/bash`


Once your docker start just run `mg --help` to make sure everything is ready to go.

Now you can start producing and play your media.

For instance use the dash.sh script to download some ready files and publish them in mpeg-dash and hls:

    ./dash.sh


When mg finish you can start nginx to server your content: `nginx -g 'daemon off;'`

Then point your browser to `http://<container ip or localhost>/play/index.html?src=/dash` to play your content in mpeg-dash or hls.

