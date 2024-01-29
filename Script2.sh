#!/bin/bash

CurrDate=$(date +"%Y-%m-%d_%H:%M:%S")

tar -czvf ~/Desktop/home_backup_.$CurrDate.tar.gz /home
