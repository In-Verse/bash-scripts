#!/bin/bash
which ls

# Where does the ls command come from?
rpm -qf /usr/bin/ls
rpm -qf `which ls`
rpm -qf $(which ls)
