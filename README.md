### mediagoom-nginx-play
Repository for the mg Docker image

#Usage
In order to start a docker with mg use the following command:
`docker run -i -t  --name mg -p 80:80 mediagoom/nginx-play /bin/bash`
in case you do not want to make your docker web site available to the outside world
just remove `-p 80:80`.

If you want to be able to exchange files with your docker you can use the following 
command to share the /tmp dir.

`docker run -i -t  --name mg -v /tmp:/tmp -p 88:80 mediagoom/nginx-play /bin/bash`


```bash
docker build -t mg .
```
