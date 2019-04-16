# hello.ansible.docker

Dockerized ansible provisioning dockerized containers using sshd.
Useful for lightweight Ansible development and following best practices.

## Usage

```console
docker-compose run --rm ansible ./deploy.sh
```

TODO: Ansible vault for the `ANSIBLE_BECOME_password`.