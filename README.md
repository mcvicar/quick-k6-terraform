# quick-k6-terraform
I needed to spin up a simple EC2 instance, with [K6](https://k6.io/), and run a load testing script. 

## Installing
* Terraform
* An AWS account

## Running the command
Just do a regular old `terraform apply`

## Prerequisites
You'll need an AWS account, and an IAM role that Terraform can use to create the EC2 instance.

## A couple of out standing things
* You'll need to modify the k6 script to whatever you are load testing
* The instance does not shut it's self down after the k6 script has finished. *DO NOT* blame me for the cost of leaving it running. 
* The output is currently saved on the instance as JSON. I _should_ add in an option for pushing the results to cloudwatch and the JSON into an S3 bucket.


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details