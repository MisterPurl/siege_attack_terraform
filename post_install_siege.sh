#!/bin/bash
sudo apt update -y
sudo apt install siege -y
sudo siege -c10 -r1000 http://THEWEBSITE