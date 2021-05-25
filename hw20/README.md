# Home work 20

## 1. Create 2 servers with S1 - ubuntu/focal64 and  S2 - centos/8

## 2. Create hosts.yml file and define

    - ubuntu host group for S1
    - centos host group for S2
    - linux host group which include ubuntu and centos groups

## 3. Create a folder for groups variables. Create folders for ubuntu, centos and linux groups. Add variables for ssh user and ssh key to skip it in the command line

## 4. For ubuntu centos groups create a variable group_hw20 with values ZONE_1 and ZONE_2 respectively

## 5. Create hw201 role. Add next features to this role. All options should be set as variables

    - Install [git,docker,python3] in one task using loop
    - Create user hw20 with /bin/sh and home folder /opt/hw20.
    - Create an option to weather add or not user to sudoers group
    - As user hw20 clone any public git repo to /opt/hw20/

## 6. Create hw202 role. Add next features to this role. All options should be set as variables

    - Add the ability to copy local files to any location.
    - Install curl from deb(ubuntu) and rpm(centos) packages which located in the role under file folder. 
    - Add ability to set permissions for these files.
    - Template. Create a file /HW20_FILE_INFO with content of a variable group_hw20

# HW 20 screenshot
![Picture](https://github.com/nightdread/tmsrep/blob/master/Screenshot/2021-05-23_15-41-18.jpg)
![Picture](https://github.com/nightdread/tmsrep/blob/master/Screenshot/2021-05-23_15-41-41.jpg)

#HW 23 screenshot
![Picture](https://github.com/nightdread/tmsrep/blob/master/Screenshot/2021-05-23_16-06-48.jpg)
![Picture](https://github.com/nightdread/tmsrep/blob/master/Screenshot/2021-05-23_16-07-12.jpg)
