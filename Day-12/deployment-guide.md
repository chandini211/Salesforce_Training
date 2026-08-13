# Chapter 12 – Deployment Guide

## 1. Prerequisites

- Salesforce CLI
- Git
- VS Code
- Salesforce Developer Org access
- Salesforce project source code

## 2. Git Workflow

The Chapter 12 Git workflow is:

Feature Branch
↓
Commit
↓
Push
↓
Pull Request
↓
Code Review
↓
Merge

## 3. Salesforce CLI Authentication

The development Salesforce org is configured with the alias:

`placement-dev`

Verify the connected org:

```bash
sf org list