# Testing Internal vm with Google Private Access and Cloud NAT



1. Deploy all resources
```
terraform apply
```
2. SSH vm
```
gcloud compute ssh vm name --zone=zone --project=projectID --tunnel-through-iap
```
3. Run below command to update vm instance - it will fail
```
sudo apt-get update
```
4. Enable Private Google Access on "company-subnet-priv"
```
subnet_private_access = true
terraform apply
```
5. Run below command again to update vm instance - it will only contact Google's external APIs
```
sudo apt-get update
```
6. Add "private-subnet" to Cloud NAT - in terraform.tfvars add below to subnetworks block
```
{
    name                     = "private-subnet"
    source_ip_ranges_to_nat  = ["ALL_IP_RANGES"]
    secondary_ip_range_names = []
  },
```
7. Run the update command again - it will now contact Debian's external repo
```
sudo apt-get update
```