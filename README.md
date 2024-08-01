# TFE Patroni Lab

## Description
A lab to demonstrate how TFE can work with Patroni using consul as the DCS and using consul service discovery
as the mechanism to find the Postgres leader.

## Prerequisites
* Install docker
* Update your /etc/hosts file to contain `127.0.0.1 localhost tfe.local` (resolving tfe.local to 127.0.0.1)

## Installation
Procure a TFE FDO license and create a file named `tfe.env` in the ./tfe folder.  The file should look like:
    ```tfe.env
    # Filename: tfe.env
    TFE_LICENSE=<license>
    ```

### Docker Containers
A couple containers need to be built locally for this lab to work.

#### Patroni Container
You will need to enable `consul` as the DCS for Patroni.  This requires additional tools to be installed on the
patroni image after it has been built from zalando main.

To build and run the Patroni container, follow these steps:

1. Clone the Patroni repository from [Zalando's public repository](https://github.com/zalando/patroni).
2. Navigate to the cloned repository directory.
3. Build the container locally using the following command:
    ```
    docker build -t patroni .
    ```
4. Once the build is complete, you now need to go into ./patroni and run (this will enable consul as a DCS):
    ```
    docker build -t patroni-consul .
    ```

#### Dnsmasq Container
To build and run the Dnsmasq container, follow these steps:

1. Go into the `./dnsmasq` directory.
2. Build the container locally using the following command:
    ```
    docker build -t dnsmasq .
    ```

## Usage
Once all the containers have been built, you should be able to run 
    ```
    docker compose up -d
    ```
Wait a couple minutes and then navigate to [http://tfe.local/](http://tfe.local/) in a browser

You will need to create an initial admin user using the IACT.  You can do this simply by doing a `docker exec`
into the tfe container and running `tfectl admin token` to get the IACT.  Copy that value and navigate to
[http://admin/account/new?token=<token>](http://admin/account/new?token=<token>)

## Load Testing
WIP

## Contact
jeremy.mefford@hashicorp.com
@jeremy.mefford - slack
