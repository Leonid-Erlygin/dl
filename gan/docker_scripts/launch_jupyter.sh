docker run\
 -d\
 --ipc=host\
 --rm\
 -v "$(realpath ..)":/home/devel/gan\
 --name dl_gan_lab\
 --runtime nvidia\
 -p 4979:4979\
 -t dl\
 jupyter lab\
 --ip 0.0.0.0\
 --port 4979\
 --allow-root\
 --NotebookApp.token=''\
 --NotebookApp.password=''\
