# gadget-inc/puppeteer-action
> A GitHub Action / Docker image for Puppeteer, the Headless Chrome Node API

## About

Forked from [buildkite/puppeteer][buildkiteUrl] and based on
[this troubleshooting guide][troubleshootingUrl].

## Usage

Puppeteer will need to be launched with:
```js
browser.launch({ executablePath: 'google-chrome-unstable' })
```
This is done by default in [@ianwalter/bff](https://www.npmjs.com/package/@ianwalter/bff).

As a [GitHub Action][actionsUrl]:

```yml
name: Main
on: push
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@master
      - name: Install
        uses: gadget-inc/puppeteer-action@master
        with:
          args: yarn
      - name: Test
        uses: gadget-inc/puppeteer-action@master
        with:
          args: yarn test
```

As a [Docker container][dockerUrl]:

```console
docker pull gadget-inc/puppeteer-action
```

## Related

* [`@ianwalter/bff`][bffUrl] - Your friendly test runner/framework
* [`@ianwalter/bff-puppeteer`][bffPuppeteerUrl] - A bff plugin to enable
  Puppeteer-based testing

## License

Apache 2.0 with Commons Clause - See [LICENSE][licenseUrl]

&nbsp;

Created by [Ian Walter](https://iankwalter.com)

[buildkiteUrl]: https://github.com/buildkite/docker-puppeteer
[troubleshootingUrl]: https://github.com/GoogleChrome/puppeteer/blob/master/docs/troubleshooting.md
[actionsUrl]: https://github.com/features/actions
[dockerUrl]: https://hub.docker.com/r/gadget-inc/puppeteer-action
[bffUrl]: https://github.com/ianwalter/bff
[bffPuppeteerUrl]: https://github.com/ianwalter/bff-puppeteer
[licenseUrl]: https://github.com/ianwalter/docker-puppeteer/blob/master/LICENSE
