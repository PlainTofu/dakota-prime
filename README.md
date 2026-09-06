# dakota-prime
Custom bootc image based on Bluefin Dakota

## Fork of projectbluefin/dakota with AMD GPU overclocking enabled

## Bluefin
*Dakotaraptor steini*

[Bluefin's](https://projectbluefin.io) final form. 

`projectbluefin/dakota` is built on [GNOME OS](https://os.gnome.org/) using [BuildStream](https://buildstream.build/) and then published as a bootc container.

## Updates

Renovate checks the Dakota source image every six hours and opens a pull request
when its digest changes. The pull request runs the image build, and merging it
publishes the updated image. The scheduled daily build remains as a fallback.

Set a repository `RENOVATE_TOKEN` secret containing a fine-grained token with
repository contents and pull request write permissions. A token is needed so
Renovate-created pull requests can run the build workflow; GitHub suppresses
workflow runs created with the default `GITHUB_TOKEN`.
