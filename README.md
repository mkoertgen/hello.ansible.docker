# hello.ansible.docker

Dockerized ansible provisioning dockerized containers using sshd.
Useful for lightweight Ansible development and following best practices.

## Usage

By default, running `./deploy.sh` from the ansible container will

- provision the `myhost` container (alpine+sshd),
- optionally downloading required dependencies from ansible-galaxy (here bootstrap),
- bootstrapping ansible on target systems,
- using inventory `dev`  - containers only, usually also `test` (e.g. VMs/Vagrant) and `prod` (bare metal or cloud)
- and playbook `site.yml` (master playbook importing all your microservices/components).

Here is an example session

```console
$docker-compose run --rm ansible ./deploy.sh
Creating network "helloansibledocker_default" with the default driver
Creating volume "helloansibledocker_ansible_roles" with default driver
Creating helloansibledocker_myhost_1 ... done
+ PLAYBOOK=site.yml
+ INVENTORY=dev
...
+ ansible-galaxy install -r requirements.yml
- downloading role 'bootstrap', owned by robertdebock
...
+ sshpass -p password ansible-playbook -i inventories/dev site.yml ...

PLAY [Prepare system to be managed by Ansible] *************************
...
PLAY [Update application] **********************************************
...
PLAY RECAP *************************************************************
myhost                  : ok=21   changed=5    unreachable=0    failed=0
```
