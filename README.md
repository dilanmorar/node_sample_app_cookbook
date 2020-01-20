# node_cookbook

TODO: Enter the cookbook description here.

# Task

Create a cookbook that installs the nodejs sample app



# It should have the following definition of done:
- be on Github
- be a new cookbook
- have integration and unit tests
- Minimum documentation as MD file
- All test passing
- Should be working on port 80
Maybe the file is not executable so ran the provision script manually.
- we should be able to run the tests locally
- we should be able to run the tests on AWS
It ran using my kitchen.cloud.yml file but used my key but that had the (retry in 3 seconds) error
caused by
```
transport:
  ssh_key: ~/.ssh/dilan-morar-eng48.pem
```

What is packer:

Why use packer:
Packer helps keep development, staging, and production as similar as possible. Packer can be used to generate images for multiple platforms at the same time
