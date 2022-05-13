# KaiMonkey - Vulnerable Terraform Infrastructure

[![License: Apache 2.0](https://img.shields.io/badge/license-Apache%202-blue)](https://github.com/tenable/KaiMonkey/blob/master/LICENSE)
[![GitHub release](https://img.shields.io/github/release/tenable/KaiMonkey)](https://github.com/tenable/kaimonkey)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/tenable/KaiMonkey/pulls)

KaiMonkey provides vulnerable infrastructure as code (IaC) to help explore and understand common cloud security threats exposed via IaC.

## Introduction

KaiMonkey is an effort to provide a playground of vulnerable infrastructure as code to help analyze & strategize the approach to be taken to secure from code to cloud.

The project can help you get familiar with IaC security issues and verify that your [IaC scanner](https://github.com/tenable/terrascan) is working.  The project is maintained and enhanced over time to increase the types of problems represented and to add support for additional IaC and Cloud providers. Contributions are welcome.

To learn more about the security risks in KaiMonkey, you can leverage [Terrascan](https://github.com/tenable/terrascan), our open-source tool to detect compliance and security violations before provisioning the infrastructure. You can also use the [Tenable.cs](https://www.tenable.com/products/tenable-cs/evaluate) platform for an experience that extends beyond the command line with a SaaS console and pre-built integrations into your source code repositories, ticketing systems, CI/CD pipelines, etc.

## Where to get help

* To learn more about Terrascan's features and capabilities, see the documentation portal: https://runterrascan.io

<p align="center">
    Join our community
<br/>
<a href="https://discord.gg/ScUPMzyG3n">
    <img src="http://fig.io/icons/discord-logo-square.png" width="80px" height="80px" />
</a>
</p>

## KaiMonkey Pre-requisites

* Terraform 0.12
* aws cli
* azure cli
* Optional - Terrascan open source tool to scan KaiMonkey

## Getting Started with KaiMonkey

1. `git clone https://github.com/tenable/KaiMonkey.git`
2. `cd KaiMonkey/terraform/aws/`
3. `terraform init`
4. `terraform plan` &#10229; optional
5. `terraform apply`

## Getting Started with Terrascan

Docker is typically the easiest way to get started because you don't need to install Terrascan on your system.  Terrascan builds are also available from the [releases page](https://github.com/tenable/terrascan/releases).

### With Docker

1. `git clone https://github.com/tenable/KaiMonkey.git`
2. `cd KaiMonkey/terraform/aws`
3. `docker run --rm -v "$(pwd):/iac" -w /iac tenable/terrascan scan -t aws`

### With native executables

0. Download the appropriate binary from the [releases page](https://github.com/tenable/terrascan/releases).
1. `git clone https://github.com/tenable/KaiMonkey.git`
2. `cd KaiMonkey/terraform/aws`
3. `path/to/terrascan scan -t aws`


