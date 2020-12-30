# sba-status

The [SBA Status Page](https://status.sba.gov) provides transparent information about the current and historical operating status of the SBA's digital services. It is built using the open source status page [cState](https://github.com/cstate/cstate).

## Features

* Open source
* Automatically detects, reports, and resolves outages using Route53 health checks
* Lighthouse accessiblity reports

## Building the application

The application code is located in this repository and is built with hugo. [CircleCI](./.circleci/config.yml) manages the deployment of code to an S3 bucket and the execution of daily [Lighthouse](https://github.com/GoogleChrome/lighthouse) reports. Check out the [cState docs](https://github.com/cstate/cstate/wiki) for more information on how it works.

## Hosting the application

The SBA Status Page is hosted in AWS using the [SBA's Static Website Terraform module](https://registry.terraform.io/modules/USSBA/static-website/aws/latest). The module handles all of the heavy lifting of getting a static website in S3 up and running.

## How alerts are configured

The SBA Status Page automatically detects, reports, and resolves outages using Route53 health checks. This is configured by using the [SBA's cState Health Checker terraform module](https://registry.terraform.io/modules/USSBA/cstate-healthchecker/aws/latest).

For more information on how this works and how to configure it, see the GitHub repository [README](https://github.com/USSBA/terraform-aws-cstate-healthchecker)
