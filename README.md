# ptouch-print-service

Tiny web server to provide an endpoint to print text via a USB-connected Brother P-touch label printer. The web service wraps [ptouch-print](https://dominic.familie-radermacher.ch/projekte/ptouch-print/) by Dominic Radermacher.

## Run via Docker

Ensure the correct USB device is passed to the container using the --device flag. You may need to adjust permissions on your host system to allow container access to the USB device.

```
docker run --rm -it \
  --device=/dev/usb/lp0:/dev/usb/lp0 \
  -p 8080:8080 ptouch-print-service:latest
```

## Example request

```
curl -X POST http://localhost:8080/print \
     -H "Content-Type: application/json" \
     -d '{"text": "valid-text-123"}'
```

## License

This project is licensed under the MIT License.