# Monitoring and Observability

## Overview

Centralized monitoring was implemented using Azure Monitor and Log Analytics Workspace.

## Components

### Log Analytics Workspace

Central repository for logs and metrics.

### Diagnostic Settings

Configured for:

* AKS
* Azure Container Registry
* Key Vault

### Action Group

Configured to send alert notifications.

### Alert Rules

Implemented alerts for:

* AKS CPU utilization
* Key Vault availability
* ACR availability

## Monitoring Architecture

Azure Resources
↓
Diagnostic Settings
↓
Log Analytics Workspace
↓
Azure Monitor
↓
Action Group
↓
Email Notifications

## Validation

Verify diagnostic settings:

Azure Portal → Resource → Monitoring → Diagnostic Settings

Verify alerts:

Azure Monitor → Alerts

Verify logs:

Log Analytics Workspace → Logs

## Screenshots

Add screenshots:

* Log Analytics Workspace
* Diagnostic Settings
* Alert Rules
* Action Group
* Azure Monitor Dashboard

## Benefits

* Centralized logging
* Real-time monitoring
* Alerting and notifications
* Improved operational visibility
