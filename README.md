# KaiMonkey - Vulnerable Terraform Infrastructure 

[![License: Apache 2.0](https://img.shields.io/badge/license-Apache%202-blue)](https://github.com/accurics/KaiMonkey/blob/master/LICENSE)
[![GitHub release](https://img.shields.io/github/release/accurics/KaiMonkey)](https://github.com/accurics/kaimonkey)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/accurics/KaiMonkey/pulls)
[![community](https://img.shields.io/discourse/status?server=https%3A%2F%2Fcommunity.accurics.com)](https://community.accurics.com)

Kaimonkey provides example vulnerable infrastructure to help cloud security, DevSecOps and Devops teams explore and understand common cloud security threats exposed via infrastructure as code.

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

Accurics-Kaimonkey is an effort to provide a playground vulnerable infrastructure to cloud security, DevSecOps and Devops  and help teams to analyze & strategies the approach to be taken to secure from code to cloud. 

The project is intentionally vulnerable infrastructure as code which can help teams get familiar with IaC security issues and verify that their IaC scanner is working.  We intend to maintain and enhance the project over time, to not only increase the types of problems represented but to add support for additional IaC and Cloud providers.  Contributions are welcome.

In addition to KaiMonkey, you can leverage Terrascan (https://github.com/accurics/terrascan) open source tool to detect compliance and security violations in kaiMonkey before provisioning the  infrastructure.

Terrascan provides

* 500+ Policies for security best practices
* Scanning of Terraform 12+ (HCL2)
* Scanning of Kubernetes YAML/JSON
* Support for AWS, Azure, GCP, Kubernetes and GitHub

## Pre-requisites 

* Terraform 0.12
* aws cli
* azure cli
* Optional - Terrascan open source tool to scan the kaimonkey


## Getting Started

```
git clone https://github.com/accurics/KaiMonkey.git

cd KaiMonkey/terraform/aws/

terraform init

terraform plan <-- you can omit this.

terraform apply

```
One can immediately get started with Accurics by adding it from the marketplace.

Steps to configure Accurics

### IaC Setup

1. Create a new environment from Accurics dashboard. Select a cloud provider.
2. Connect to Github and allow Accurics to read github repos.
3. Select the repo to scan.
4. Enable the set of policies to scan IaC with.
5. Verify the details and click on finish.

This will spin up a dashboard and run first scan and present you with detailed list of violations in IaC

### Cloud Setup

1. Create a new environment from Accurics Dashboard and select a cloud provider.
2. Enable Configure CloudScan checkbox and provide requested details.
3. Ignore IaC configuration if you only want to run cloud scan.
4. Select set of policies.
5. Verify details and finish.

Similar to IaC scan, dashboard will highlight security violations in cloud environments.
