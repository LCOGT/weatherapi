# Las Cumbres Observatory Weather API Server

This is the source code for the Las Cumbres Observatory Weather API Server,
which is deployed at: <https://weather-api.lco.global/>. The API is documented
on the [LCO Developers Documentation Website](https://developers.lco.global/#weather).

## Production Deployment

This project is built automatically by the [LCO Jenkins Server](http://jenkins.lco.gtn/).
Please see the [Jenkinsfile](Jenkinsfile) for further details.

This project is deployed to the LCO Kubernetes Cluster. Please see the
[LCO Helm Charts Repository](https://github.com/LCOGT/helm-charts) for
further details.

## Getting Started

These instructions will get you a copy of the project up and running on your
local machine for development and testing purposes.

### Weather Server

This will build a Docker image named `weatherserver`, containing the server code:

```bash
$ docker build --pull -t my-weather-server:latest .
```

This Docker image can be run by executing this command:

```bash
$ docker run --rm -it -p 8080:8080 my-weather-server:latest
```

#### Local development

To run the web server locally:

```bash
$ go run weather.go
```

### Weather Client

Please see the [LCO Weather Client Repository](https://github.com/LCOGT/weatherclient).

License
-------

This project is licensed under the GNU GPL v3 License - see the
[LICENSE](LICENSE) file for details.
