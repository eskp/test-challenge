
### Test challenge

Please see the Readmes in `terraform` and `ansible` directories on how to get started.

First step is to provison the required infrastructure which is done with Terraform.

Follow the instructions inside `terraform` to set up and trigger the initial run with `terraform apply`.

This will go ahead and create the needed AWS infrastructure, configure the VM instance with Ansible and output Nginx page content in the required format.

For any future Ansible runs, execute `ansible-playbook` command from `ansible` directory like so:
`ansible-playbook test-instance.yml`



### Future nice to haves, outside of the scope of this challenege

- Terraform: remote state storage
- Cadvisor: I thought about creating a little script that logs the container usage every 10 seconds to filesystem. Something like:
        while true
        do
        docker stats --no-stream nginx >> /data/nginx/container_usage.log
        sleep 5
        done
However it is more futureproof to use a proper monitoring solution like Cadvisor. In a production environment Cadvisor can then be scraped by a monitoring solution, such as Prometheus, for historical retrieval. 
- Add CI/CD and tests