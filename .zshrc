alias dm='docker-machine'
alias orca='cd /Users/ryanzhang/localrepo/src/github.com/docker/orca'
alias enzi='cd /Users/ryanzhang/localrepo/src/github.com/docker/orca/enzi'
alias runenzi='docker rm -f enzi-api-01; docker run -d \--name enzi-api-01 --net enzi --net-alias api -v enzi-tls:/tls -p 4443:4443 docker/enzi:dev --db-addr=rethinkdb.enzi api --enable-docs'
alias dockerclean='docker rmi -f $(docker images -q -a -f dangling=true); docker swarm leave --force; docker stop $(docker ps -a -q); docker rm $(docker ps -a -q); docker volume rm $(docker volume ls -q)'
alias dockerinstall='docker swarm init; docker run --rm -it --name ucp -v /var/run/docker.sock:/var/run/docker.sock docker/ucp:$(make print-TAG) install --swarm-port 3376'
alias makeinc='./script/run_inc make all image'
alias makeall='./script/run make build image'
export MACHINE_CREATE_FLAGS="--virtualbox-memory 2048 --virtualbox-disk-size 8000"
export MACHINE_DRIVER=virtualbox

alias oclean1='eval $(docker-machine env node1); docker rmi -f $(docker images -q -a -f dangling=true); docker swarm leave --force; docker stop $(docker ps -a -q); docker rm $(docker ps -a -q); docker volume rm $(docker volume ls -q); eval $(docker-machine env --unset)'
alias oinstall1='eval $(docker-machine env --unset); ./script/copy_orca_images_machine node1; eval $(docker-machine env node1); docker run --rm -it --name ucp -v /var/run/docker.sock:/var/run/docker.sock docker/ucp:$(make print-TAG) install --swarm-port 3376 --host-address $(docker-machine ip node1); eval $(docker-machine env --unset);'
alias oset1='eval $(docker-machine env node1)'
alias ounset='eval $(docker-machine env --unset)'
alias oreset1='dm rm node1; docker-machine create -d virtualbox --virtualbox-memory "2000" --virtualbox-disk-size "5000" --virtualbox-boot2docker-url ~/Downloads/boot2docker.iso node1'
