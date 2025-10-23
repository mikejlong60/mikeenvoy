# Demonstration of Discrimination between HTTP and TCP Traffic Coming into Port 80

1. Run the docker container containing Envoy, a TCP server(socat), and an HTTP(Nginx) server
    1. docker compose up
2. Send an HTTP request to port 80
    1. curl -I http://localhost/
    2. Observe the logs from docker and see that Nginx received the request
3. Send a plain TCP request to the Alpine image using netcat
    1. printf 'not http \n' | nc -v localhost 80
    2. Observe the logs that indicate that the tcp server running at port 9000 actually received the request, the result of Envoy detecting that the request coming into port 80 was not HTTP and forwarded it to port 9000(by the fall through of the request not being any of the "http/1.1", "http/1.0", "h2c" protocols).
