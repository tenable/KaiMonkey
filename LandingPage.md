# Accurics - Tag Line

Accurics platform enables immutable security by consistently protecting the full cloud native stack, infrastructure as code and identifying the drifts between them.

![Accurics](https://github.com/accurics/kai-monkey-aws/blob/main/logo.png)

Accurics keeps your cloud infrastucture in check and allows you to invest more time in adapting latest technologies.

## Table of Contents

* [Introduction](#introduction)
* [Getting Started](#getting-started)
  * [IAC](#IaC-Setup)
  * [Cloud](#Cloud-setup)
* [Contributing](#contributing)
* [Support](#support)

## Introduction

Accurics can scan throught your cloud environment and identify security vulnerabilities. Also one can also identify these issues before deploying the 
resources through IaC. Just scan your IaC before actually deploying the resource and remediate the issues before they enter in environments.

## Getting Started

One can immideately get started with Accurics by adding it form marketplace.

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

Similar to IaC scan, dashboard will highlight security violations in cloud environment.
