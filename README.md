# ptouch-print-service

Tiny web server to provide an endpoint to print text via a USB-connected Brother P-touch label printer. The web service wraps [ptouch-print](https://dominic.familie-radermacher.ch/projekte/ptouch-print/) by Dominic Radermacher.

## Run via Docker

Ensure the correct USB device is passed to the container using the --device flag. You may need to adjust permissions on your host system to allow container access to the USB device.

```
docker run --rm --name ptouch-print-service -it \
  --device=/dev/usb/lp0:/dev/usb/lp0 \
  -p 8080:8080 andyatsol1/ptouch-print-service:latest
```

## Example request

Only alphanumeric characters and dashes are permitted values at present.

```
curl -X POST http://localhost:8080/print \
     -H "Content-Type: application/json" \
     -d '{"text": "valid-text-123"}'
```

Note there is no authentication required.

## Useful links

* https://dominic.familie-radermacher.ch/projekte/ptouch-print/
* https://git.familie-radermacher.ch/linux/ptouch-print.git
* https://github.com/HenrikBengtsson/brother-ptouch-label-printer-on-linux

## Build Docker image

If you prefer to build the image locally and run it

```
docker build -t my-ptouch-print-service .
docker run --rm --name my-ptouch-print-service -it \
  --device=/dev/usb/lp0:/dev/usb/lp0 \
  -p 8080:8080 my-ptouch-print-service
```


## License

This project is licensed under the MIT License.