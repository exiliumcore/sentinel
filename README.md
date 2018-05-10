# Exilium Sentinel

An all-powerful toolset for Exilium.

[![Build Status](https://travis-ci.org/exilium/sentinel.svg?branch=master)](https://travis-ci.org/exilium/sentinel)

Sentinel is an autonomous agent for persisting, processing and automating Exilium governance objects and tasks.

Sentinel is implemented as a Python application that binds to a local version 1.0 exiliumd instance on each Exilium Masternode.

This guide covers installing Sentinel onto an existing Masternode in Ubuntu 14.04 / 16.04.

## Installation

### 1. Install Prerequisites

Make sure Python version 2.7.x or above is installed:

    python --version

Update system packages and ensure virtualenv is installed:

    $ sudo apt-get update
    $ sudo apt-get -y install python-virtualenv


### 2. Install Sentinel

Clone the Sentinel repo and install Python dependencies.

    $ git clone https://github.com/exiliumcore/sentinel.git && cd sentinel
    $ virtualenv ./venv
    $ ./venv/bin/pip install -r requirements.txt

### 3. Set up Cron

Set up a crontab entry to call Sentinel every minute:

    $ crontab -e

In the crontab editor, add the lines below, replacing '/home/YOURUSERNAME/sentinel' to the path where you cloned sentinel to:

    * * * * * cd /home/YOURUSERNAME/sentinel && ./venv/bin/python bin/sentinel.py >/dev/null 2>&1

### 4. Test the Configuration

Test the config by runnings all tests from the sentinel folder you cloned into (exiliumd should be running to pass all tests)

    $ ./venv/bin/py.test ./test

With all tests passing and crontab setup, Sentinel will stay in sync with exiliumd and the installation is complete

### 5. Start sentinel
 
with all tests passing, start sentinel with the below line.

venv/bin/python bin/sentinel.py  
  
(should return nothing but silence. This is how you know it's working, and your masternode is working.)

On your exilium-cli folder run the below line.

./exilium-cli mnsync status

(if the network is synced and all is well, you should see...)

{
"AssetID": 999,
"AssetName": "MASTERNODE_SYNC_FINISHED",
"Attempt": 0,
"IsBlockchainSynced": true,
"IsMasternodeListSynced": true,
"IsWinnersListSynced": true,
"IsSynced": true,
"IsFailed": false
}

"That is all. Now sentinel and your MasterNode is running.


*** If the daemon isn't synced when you run sentinel, you should see: "exiliumd not synced with network! Awaiting full sync before running Sentinel."
Wait to the daemon to synchronize with the network, and run again | venv/bin/python bin/sentinel.py | then |./exilium-cli mnsync status |



## Configuration

An alternative (non-default) path to the `exilium.conf` file can be specified in `sentinel.conf`:

    exilium_conf=/path/to/exilium.conf

## Troubleshooting

To view debug output, set the `SENTINEL_DEBUG` environment variable to anything non-zero, then run the script manually:

    $ SENTINEL_DEBUG=1 ./venv/bin/python bin/sentinel.py

## Contributing

Please follow the [ExiliumCore guidelines for contributing](https://github.com/exiliumcore/exilium/blob/master/CONTRIBUTING.md).

Specifically:

* [Contributor Workflow](https://github.com/exiliumcore/exilium/blob/master/CONTRIBUTING.md#contributor-workflow)

    To contribute a patch, the workflow is as follows:

    * Fork repository
    * Create topic branch
    * Commit patches

    In general commits should be atomic and diffs should be easy to read. For this reason do not mix any formatting fixes or code moves with actual code changes.

    Commit messages should be verbose by default, consisting of a short subject line (50 chars max), a blank line and detailed explanatory text as separate paragraph(s); unless the title alone is self-explanatory (like "Corrected typo in main.cpp") then a single title line is sufficient. Commit messages should be helpful to people reading your code in the future, so explain the reasoning for your decisions. Further explanation [here](http://chris.beams.io/posts/git-commit/).

### License

Released under the MIT license, under the same terms as ExiliumCore itself. See [LICENSE](LICENSE) for more info.
