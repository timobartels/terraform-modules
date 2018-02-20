# This is a sample Terraform module

### Functionality
This module simply creates an EC2 instance that serves 'Hello World' when going to its port 8080.
The module creates a security group that allow inbound traffic on port 8080 and assigns that to the EC2 instance.

### How to call the module
To call this module from another terraform file, use the following in the module call:

```
source = "git::git@github.com:timobartels/terraform-modules.git//services/webserver"  
```

### Input variables
Check the 'input.tf' file for all valid input variables

### Module output variables
Check the 'output.tf' file for all output variables

