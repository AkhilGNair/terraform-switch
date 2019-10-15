# terraform-switch

A simple shell script to switch the linked version of `terraform`.

# Usage

```
$ terraform-switch 0.12.7
 :: Downloading terraform 0.12.7
 :: Switching to terraform 0.12.7
 :: Done!
$ terraform --version
Terraform v0.12.7

$ terraform-switch 0.12.9
 :: Downloading terraform 0.12.9
 :: Switching to terraform 0.12.9
 :: Done!
$ terraform --version
Terraform v0.12.9

$ # v0.12.7 is now cached
$ terraform-switch 0.12.7
 :: Switching to terraform 0.12.7
 :: Done!
$ terraform --version
Terraform v0.12.7
```

