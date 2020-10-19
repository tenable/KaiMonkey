# KaiMonkey - Vulnerable Terraform Infrastructure 

[![License: Apache 2.0](https://img.shields.io/badge/license-Apache%202-blue)](https://github.com/accurics/KaiMonkey/blob/master/LICENSE)
[![GitHub release](https://img.shields.io/github/release/accurics/KaiMonkey)](https://github.com/accurics/kaimonkey)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/accurics/KaiMonkey/pulls)
[![community](https://img.shields.io/discourse/status?server=https%3A%2F%2Fcommunity.accurics.com)](https://community.accurics.com)

KaiMonkey provides example vulnerable infrastructure to help cloud security, DevSecOps and DevOps teams explore and understand common cloud security threats exposed via infrastructure as code.

The KaiMonkey project is sponsored by [Accurics](https://www.accurics.com/).

Accurics™ enables cyber resilience through self-healing as organizations embrace cloud native infrastructure. The Accurics platform self-heals infrastructure by codifying security throughout the development lifecycle. It programmatically detects and resolves risks across Infrastructure as Code before infrastructure is provisioned, and maintains the posture in runtime by programmatically mitigating risks from changes.

![Accurics](https://github.com/accurics/KaiMonkey/blob/master/logo.png)

Accurics keeps your cloud infrastucture in check, freeing up more time for innovation.

* GitHub Repo: https://github.com/accurics/kaimonkey
* Documentation: https://docs.accurics.com
* Discuss: https://community.accurics.com

## Table of Contents

* [Introduction](#introduction)
* [Pre-requisites ](#Pre-requisites)
* [Getting Started](#getting-started)
  * [IAC](#IaC-Setup)
  * [Cloud](#Cloud-setup)
* [Contributing](#contributing)
* [Support](#support)

## Introduction

KaiMonkey is an effort to provide a playground vulnerable infrastructure to cloud security, DevSecOps and DevOps and help teams to analyze & strategize the approach to be taken to secure from code to cloud. 

The project is intentionally vulnerable infrastructure as code which can help teams get familiar with IaC security issues and verify that their IaC scanner is working.  We intend to maintain and enhance the project over time, to not only increase the types of problems represented but to add support for additional IaC and Cloud providers.  Contributions are welcome.

To learn more about the security risks in KaiMonkey, you can leverage [Terrascan](https://github.com/accurics/terrascan), our open source tool to detect compliance and security violations before provisioning the infrastructure.  You can also use the Accurics platform for an experience that extends beyond the command line with a SaaS console and pre-built integrations into your source code repositories, ticketing systems, CI/CD pipelines, etc.

Terrascan provides

* 500+ Policies for security best practices
* Scanning of Terraform 12+ (HCL2)
* Scanning of Kubernetes YAML/JSON
* Support for AWS, Azure, GCP, Kubernetes and GitHub

Accurics provides

* 1800+ Policies for security best practices
* Scanning of many IaC and orchestration providers, such as Terraform, Kubernetes, Helm, Istio, Amazon CloudFormation, Azure Resource Manager, Google Cloud Deployment Manager, and more
* Support for AWS, Azure, GCP cloud environments
* Compliance reporting for standards such as GDPR, CIS, SOC2, HIPAA, etc.
* Deeper security analysis including breach path prediction and determination of blast radius
* Integration of scanning and remediation into your repos and pipelines, including automated fixes and pull or merge requests
* More information is available on [our website](https://www.accurics.com/pricing/).

## KaiMonkey Pre-requisites 

* Terraform 0.12
* aws cli
* azure cli
* Optional - Terrascan open source tool to scan KaiMonkey


## Getting Started with KaiMonkey

1. `git clone https://github.com/accurics/KaiMonkey.git`
2. `cd KaiMonkey/terraform/aws/`
3. `terraform init`
4. `terraform plan` &#10229; optional
5. `terraform apply`

## Getting Started with Terrascan

Docker is typically the easiest way to get started because you don't need to install Terrascan on your system.  Terrascan builds are also available from the [releases page](https://github.com/accurics/terrascan/releases).

### With Docker

1. `git clone https://github.com/accurics/KaiMonkey.git`
2. `cd KaiMonkey/terraform/aws`
3. `docker run --rm -v "$(pwd):/iac" -w /iac accurics/terrascan scan -t aws`

### With native executables

0. Download the appropriate binary from the [releases page](https://github.com/accurics/terrascan/releases).
1. `git clone https://github.com/accurics/KaiMonkey.git`
2. `cd KaiMonkey/terraform/aws`
3. `path/to/terrascan scan -t aws`

## Getting Started with Accurics

One can immediately get started with Accurics by adding the Accurics app from the [GitHub marketplace](https://github.com/marketplace/accurics).  The installation process will walk you through the process of configuring Accurics for your repo.  Note that you may need to fork KaiMonkey into your repo if you want it to show up with your projects.

To create a new environment without using the installation wizard, you will need to first login to your Accurics dashboard.

### Configure to scan your IaC repo

1. Create a new environment from Accurics dashboard, selecting a cloud provider.
2. Connect to GitHub and allow Accurics to read GitHub repos.
3. Select the repo to scan.
4. Enable the set of policies to scan IaC with.
5. Verify the details and click on finish.

This will spin up a dashboard, run the first scan and present you with a detailed list of violations in the IaC

### Configure to scan your cloud runtime (available with certain commercial plans)

1. Create a new environment from Accurics Dashboard, selecting a cloud provider.
2. Enable Configure Cloud Scan checkbox and provide requested details.
3. Ignore IaC configuration if you only want to run cloud scan.
4. Select set of policies.
5. Verify details and finish.

Similar to the IaC scan, the dashboard will highlight security violations in the cloud environment.
