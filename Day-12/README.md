# Day 12 – From Developer Org to Production

## Overview

Day 12 focused on understanding and implementing a complete Salesforce deployment workflow using Salesforce CLI, Git, GitHub, feature branches, Pull Requests, code review, Salesforce deployment, testing, and verification.

## Objectives

- Understand the Salesforce deployment lifecycle
- Work with Salesforce CLI
- Verify a Salesforce development org
- Retrieve Salesforce metadata
- Track Salesforce metadata using Git
- Create and use a feature branch
- Push changes to GitHub
- Create a Pull Request
- Perform code review
- Merge the Pull Request into main
- Deploy metadata to the Salesforce development org
- Attempt Apex testing
- Verify the deployed functionality
- Document the complete workflow

---

## Salesforce Org

Development Org Alias:

`placement-dev`

Org verification command:

```bash
sf org display --target-org placement-dev