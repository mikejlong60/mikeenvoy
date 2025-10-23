# Dockerfile
FROM envoyproxy/envoy:dev-ac2ade65399c4926e2c907866730461b52a948e7 
COPY envoy.yaml /etc/envoy/envoy.yaml
RUN chmod go+r /etc/envoy/envoy.yaml
