AWS Bulk Migration Scripts

This repository contains PowerShell scripts for automating server migration to AWS using AWS Application Migration Service (MGN). The scripts are organized into stages, each handling a specific part of the migration process.

Repository Structure

aws-migration-scripts/

├── Stage1_ReadVariables.ps1             # Reads variables from CSV

├── Stage2_FetchSourceServers.ps1          # Fetches source servers from AWS MGN

├── Stage3_UpdateReplicationConfig.ps1     # Updates replication configuration

├── Stage4_UpdateLaunchTemplate.ps1         # Updates launch template

├── Stage5_PrepareCutover.ps1              # Prepares instance for cutover

├── Stage6_TagResources.ps1                # Tags AWS resources

├── Stage7_ConfigureNetworkInterfaces.ps1   # Configures network interfaces

├── Stage8_VerifyAndFinalize.ps1           # Verifies and finalizes migration

├── Stage9_PerformCutover.ps1              # Performs cutover

├── variables.csv                          # CSV file containing migration variables

├── README.md                              # This file

Contact
For questions or support, contact:

Your Name: manojbarot1@gmail.com

GitHub: manojbarot1
