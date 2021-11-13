# homebus-image-publisher

Grab images from a URL and publish them to Homebus.

## .homebus-image-publisher.json

Reads a list of image sources from `.homebus-image-publisher.json`.

JSON format should be an array of hash tuples with "name" and "url"
attributes. For instance,
```
[
    {
	"name": "Doorbell",
	"url": "http://10.0.1.10/snap.jpeg"
    },
    {
	"name": "Front yard",
	"url": "http://10.0.1.11/snap.jpeg"
    },
    {
	"name": "Octoprint",
	"url": "http://10.0.1.23:8080/?action=snapshot
    }
]
```

## Limitations

- configuration file must be hand-edited
- cannot currently add new devices
- processes images sequentially, timeouts can cause major delays

## License

Published under the [MIT License](https://romkey.mit-license.org).
