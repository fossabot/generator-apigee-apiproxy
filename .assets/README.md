# `.assets/` directory
> **:open_file_folder: Parent directory for this repository's
information assets.**

## Resources under `.assets/` are for this _repository_, not the product this repository delivers

Only add resources necessary for this _repository_ under `.asserts/`, e.g., images
to be displayed on the `<repo-root>/README.md` file.

> **:warning: Product dependencies don't belong in `<repo-root>/.assets/`**
>
> Assets intended to be delivered with a product should exist in their own
"build" or "dist" directories.**

## `.assets/` default tree

* `.assets/`
    * [:page_facing_up: `README.md`][assets-readme-url]
    * `media`
        * [:page_facing_up: `README.md`][assets-media-readme-url]
        * `audio`
            * [:page_facing_up: `README.md`][assets-audio-readme-url]
        * `img`
            * [:page_facing_up: `README.md`][assets-img-readme-url]
        * `video`
            * [:page_facing_up: `README.md`][assets-video-readme-url]

---

```bash

.assets/
├── README.md
└── media
    ├── README.md
    ├── audio
    │   └── README.md
    ├── img
    │   └── README.md
    └── video
        └── README.md
```

---

[Apache-2.0][license-url] © [Greg Swindle][gregswindle-url]

[assets-audio-readme-url]: media/audio/README.md
[assets-img-readme-url]: media/img/README.md
[assets-media-readme-url]: media/README.md
[assets-readme-url]: README.md
[assets-video-readme-url]: media/video/README.md
[license-url]: https://www.apache.org/licenses/LICENSE-2.0
[gregswindle-url]: https://github.com/gregswindle
