docker run\
     -d\
      --ipc=host\
       --rm\
        -v "$(realpath ..)":/home/devel/gan\
         --runtime nvidia\
          --name dl_gan_vs\
           -p 4980:4980\
            -t dl\
             /home/devel/.local/bin/code-server\
              --bind-addr 0.0.0.0:4980\
               --auth none\

