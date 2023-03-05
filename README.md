![locals_1](https://user-images.githubusercontent.com/108756145/222962322-4683f646-dd55-4453-8e70-2ec96d6fe683.jpg)

# Terraform Local Value

What is Local Values?

- Local values are like a function's temporary local variables.

- A local value assigns a name to an expression, so you can use it multiple times within a module without repeating it.

Local values can be helpful to avoid repeating the same values or expressions multiple times in a configuration, but if overused they can also make a configuration hard to read by future maintainers by hiding the actual values used.

Use local values only in moderation, in situations where a single value or result is used in many places and that value is likely to be changed in future. The ability to easily change the value in a central place is the key advantage of local values.

1. A set of related local values can be declared together in a single locals block:
~~~
locals {
  service_name = "forum"
  owner        = "Community Team"
}
~~~
2. The expressions in local values are not limited to literal constants; they can also reference other values in the module in order to transform or combine them, including variables, resource attributes, or other local values:

~~~
locals {
  # Ids for multiple sets of EC2 instances, merged together
  instance_ids = concat(aws_instance.blue.*.id, aws_instance.green.*.id)
}

locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Service = local.service_name
    Owner   = local.owner
  }
}
~~~

3. Once a local value is declared, you can reference it in expressions as local.<NAME>

~~~
resource "aws_instance" "example" {
  # ...
    ...
    ...
    ...
    ...
    ...
  tags = local.common_tags
}
~~~

