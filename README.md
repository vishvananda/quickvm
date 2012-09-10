QuickVM
=======

Simple virtualbox vm control inspired by Vagrant

Prep
====

Link the scripts
----------------

    ./link.sh

The above will link the scripts into /usr/local/bin. You need to add /usr/local/bin into your path or link it somewhere else via `./link.sh /dir/in/your/path`

Create a VM in Virtualbox
-------------------------

Use a short name (for example: dev). Veewee is a great tool for building your initial vm. I prefer to customize the vm by giving it an additional host-only interface. I then login and create my user and add an ssh key.

Add an entry to /etc/hosts
--------------------------

Put an entry in /etc/hosts so you can ssh to your vm by name:

    192.168.27.100 dev

Create initial snapshot
-----------------------

Once you have done the required customization, snapshot your vm as base:

    snapvm dev base

Usage
=====

You can use each script by specifying the name of the vm on the commandline, or you can create a directory with the name of the vm and it will automatically grab the name of the directory from the vm.  For example:

    mkdir dev
    cd dev
    startvm
    sshvm

Details
=======

resetvm
-------

Saves the current state of the vm as a snapshot named bak and resets the vm to the snapshot named base (or another if specified). This will delete any existing snapshot named bak.

    resetvm <vm> [<snapshot>]

snapvm
-------

Saves the current state of the vm as a snapshot according to the name specified.

    snapvm <vm> <snapshot>

sshvm
-----

Adds your private key into ssh-agent and sshs into the vm (requires entry in /etc/hosts).

startvm
-------

Starts the vm from shutdown or saved state.

stopvm
------

Powers off the vm. This is the same as hitting the power button on the vm.

suspendvm
---------

Saves the vm to be resumed later. This is a hypervisor-side suspend.

unresetvm
---------

Resets vm to snapshot named bak and deletes the snapshot
