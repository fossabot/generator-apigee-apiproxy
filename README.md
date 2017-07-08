#  `generator-apigee-apiproxy`

[![Build Status][travis-image]][travis-url] [![Sonar coverage][sonar-coverage-img]][sonar-coverage-url] [![Quality Gate][sonar-gate-img]][sonar-gate-url] [![Complexity][sonar-complexity-img]][sonar-complexity-url]<br>
[![NSP Status][nsp-img]][nsp-url] [![Dependency Status][daviddm-image]][daviddm-url] [![devDependencies Status](https://david-dm.org/gregswindle/generator-apigee-apiproxy/dev-status.svg)](https://david-dm.org/gregswindle/generator-apigee-apiproxy?type=dev)<br>[![NPM version][npm-image]][npm-url] [![Readme Score][readme-score-img]][readme-score-url] [![PRs Welcome][makeapullrequest-image]][makeapullrequest-url]
> ![Swagger logo][swagger-logo-20-img] Scaffold an API proxy with quality gates for Swagger, (optional) Javascript callouts, and automated build, lint, test, API documentation, packaging, and deployment to your Apigee EDGE domain of choice.

`generator-apigee-apiproxy` creates a base template to start a new API Proxy with optional tools for custom Javascript callouts. It generates a repeatable, testable, and measurable workflow that lets you focus on innovation without sacrificing quality or extensibility.

## 1. Table of contents
<!-- TOC depthFrom:2 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [1. Table of contents](#1-table-of-contents)
- [2. Installation](#2-installation)
- [3. Usage](#3-usage)
	- [3.1. **Design** your API with Swagger UI](#31-design-your-api-with-swagger-ui)
	- [3.2. **Build**, **lint**, **test**, **document**, and **push** to Git](#32-build-lint-test-document-and-push-to-git)
	- [3.3. **Package** all `apiproxy` artifacts](#33-package-all-apiproxy-artifacts)
	- [3.4. **Deploy** the `apiproxy` package to Apigee EDGE](#34-deploy-the-apiproxy-package-to-apigee-edge)
- [4. Quality gates, reports, and documentation](#4-quality-gates-reports-and-documentation)
	- [4.1. **Validate** Swagger documentation](#41-validate-swagger-documentation)
	- [4.2. **Analyze** Javascript callout source code](#42-analyze-javascript-callout-source-code)
	- [4.3. **Test** Javascript callouts](#43-test-javascript-callouts)
	- [4.4. **Generate** API documentation and complexity reports](#44-generate-api-documentation-and-complexity-reports)
- [5. Release management automation](#5-release-management-automation)
- [4. Contribute](#4-contribute)
- [5. License](#5-license)

<!-- /TOC -->

## 2. Installation

Open a terminal and run:

```bash

$ npm install generator-apigee-apiproxy --global
```

## 3. Usage

> :information_source: `generator-apigee-apiproxy` will generate files in the current working directory, so be sure to change to a new directory first if you don't want to overwrite existing files.

`generator-apigee-apiproxy` supports CD workflows that can be executed in a command-line interface.



To scaffold a new API Proxy project, open a terminal and run:

```bash

$ yo apigee-apiproxy
```

This sets up a suite of common DevSecOps tools, including:

| Tool                      | DevSecOps feature     |
| --------------------------| ----------------------|
| `babel-*`                 | Build                 |
| `browserify`              | Build                 |
| `commitplease`            | SCM/SRM               |
| `complexity-report`       | Documentation         |
| `coveralls`               | Test coverage reports |
| `eslint`                  | Test                  |
| `eslint-plugin-filenames` | Test                  |
| `eslint-plugin-json`      | Test                  |
| `eslint-plugin-security`  | Test                  |
| `jest`                    | Test                  |
| `jsdoc-to-markdown`       | Documentation         |
| `nsp`                     | Security              |
| `openapi2apigee`          | Deploy                |
| `standard-version`        | SRM                   |
| `swagger-cli`             | Test                  |
| `swagger-markdown`        | Documentation         |
| `uglify-js`               | Build                 |

### 3.1. **Design** your API with Swagger UI

1. Go to the [online Swagger Editor](http://editor.swagger.io/#/).
2. Create a well-formed Swagger document.
3. Copy the Swagger document to your clipboard.
4. Open an IDE and paste the Swagger's YAML into a new file.
5. Save the file to `openapi` directory.

### 3.2. **Build**, **lint**, **test**, **document**, and **push** to Git

If you're a lazy programmer (like me), you can run:

```bash

$ npm run build-test-push
```

Or, if that's too many characters for you, run the abbreviated command:

```bash

$ npm run btp

```

This will execute a:

1. :factory: Build. If the build passes, then it will execute
2. :100: Test, which includes these quality gates:
    1. :bathtub: Lint the
	    * Swagger documents and the
		* Javascript callout source code (if any exists). If all's good, then it will
	2. :school: Test with `jest`. If all tests pass within the coverage threshold, it will check
	3. :lock: Security (with [`nsp`][nsp-url]). If prelimary security checks pass, it'll
3. :page_facing_up: Document your
    * Swagger spec and
	* Javascript callout code (both of which you'll find in the [`docs`](./docs) directory). Finally, it'll
4. :arrow_up: Commit and push to Git.

> ##### :warning: `npm run btp` generates an automated commit message
>
> The [`prepend-header.sh`](./.github/assets/prepend-header.sh) shell script will
> use the default message "docs(api): auto-generate api docs and complexity report".
> The script can accept an alternate commit message, but that's not available from
> the `npm-script btp`, yet. If you want add that, submit a pull request :v:.

### 3.3. **Package** all `apiproxy` artifacts

Finally, you can update the repository's `apiproxy` -- your final build -- by running:

```bash

$ npm run apigee:apiproxy:update
```

This uses [`openapi2apigee`][openapi2apigee-url] behind the scenes to update the `apiproxy` artifacts
and generate an `apiproxy.zip` file in your project's root directory.

### 3.4. **Deploy** the `apiproxy` package to Apigee EDGE

Run:

```bash

$ npm run apigee:apiproxy:deploy

```

This not only generates `apiproxy` artifacts, but also deploys to an Apigee EDGE host of your choosing.

## 4. Quality gates, reports, and documentation

`generator-apigee-apiproxy` creates a consistent repository with tools that enforce Swagger quality; Javascript quality; and Javascript unit tests and code coverage.

### 4.1. **Validate** Swagger documentation
> :trophy: `generator-apigee-apiproxy` validates Swagger docs with [`swagger-cli`][swagger-cli-url].

[`swagger-cli`][swagger-cli-url] validation runs before every test execution:

```bash

$ npm test

```

[`swagger-api/validator-badge`](https://github.com/swagger-api/validator-badge)s display whether there are syntactic issues with you Swagger/OpenAPI 2.0 document:

* **Valid:** [![Swagger Validity][swagger-validity-img]][swagger-validity-url] `cordova-contacts.swagger.yaml`
* **Invalid:** [![Swagger Validity](https://img.shields.io/swagger/valid/2.0/http/api.swindle.net/cordova/v6/contacts/openapi.md.svg)](http://online.swagger.io/validator/debug?url=https://raw.githubusercontent.com/gregswindle/generator-apigee-apiproxy/master/README.md)


### 4.2. **Analyze** Javascript callout source code
> :closed_lock_with_key: :bath: :ocean: `generator-apigee-apiproxy` lints source code; checks for vulnerabilities; assesses dependency drift; and executes quality gates with `BitHound`, `eslint`, `nsp`, and `SonarQube`/`sonarcloud`.
>
> The results are displayed real-time with README badges.

Code quality analysis runs before every test execution:

```bash

$ npm test

```

If you'd like an `eslint` report in HTML (with links to errors and warnings), run the following command to generate a `eslint-report.html`:

```bash

$ npm run eslint:html

```

### 4.3. **Test** Javascript callouts
> :100: `generator-apigee-apiproxy` uses `jest` for BDD spec execution and code coverage analysis.
>
> The results are displayed real-time with README badges.

Run:

```bash

$ npm test

```

This generates:

* Detailed code coverage reports at `coverage/lcov-report/index.html`, as well as
* `lcov.info` and `clover.xml` files, which you can send to CI test coverage services like Coveralls.

### 4.4. **Generate** API documentation and complexity reports

To generate API docs, Swagger docs, and complexity reports in the `docs` directory, run:

```bash

$ npm run docs

```

`npm-script docs` is a shorthand script that executes [`jsdoc-to-markdown`][jsdoc2md-url], [`complexity-report`][complexity-report-url], and [`swagger-markdown`][swagger-markdown-url]:

```bash

$ npm run docs:api && npm run docs:complexity && npm run docs:swagger

```

## 5. Release management automation

If you and your team write commit messages that comply with the the Conventional Commit Message Specification, `generator-apigee-apiproxy` can use `standard-version` to automate

* Semantic versioning (with Git tags), and
* CHANGELOG generation

When you're ready to release, run:

```bash

$ npm run release

```

## 4. Contribute

[![PRs Welcome][makeapullrequest-image]][makeapullrequest-url]

:family: We welcome contributors and pull requests. Check out the guidelines for [contributing to `generator-apigee-apiproxy`](./.github/CONTRIBUTING.md) and our [Contributor Covenant Code of Conduct][code-of-conduct-url].

Contributions are stories with a beginning, a middle, and an end, all told through issues and pull requests.
 * [Peruse open issues][issues-url] or
 * [Open a new pull request (PR)][pr-url]

## 5. License

[Apache-2.0][license-url] © [Greg Swindle][author-url]

[api-docs-url]: https://github.com/gregswindle/generator-apigee-apiproxy/docs/API.md
[author-url]: https://github.com/gregswindle
[bithound-dep-img]: https://www.bithound.io/github/gregswindle/generator-apigee-apiproxy/badges/dependencies.svg
[bithound-dep-url]: https://www.bithound.io/github/gregswindle/generator-apigee-apiproxy/master/dependencies/npm
[bithound-dev-dep-img]: https://www.bithound.io/github/gregswindle/generator-apigee-apiproxy/badges/devDependencies.svg
[bithound-dev-dep-url]: https://www.bithound.io/github/gregswindle/generator-apigee-apiproxy/master/dependencies/npm
[codacy-img]: https://api.codacy.com/project/badge/Grade/554fe390431b455a87ba6acde3ff2989?style=flat-square
[codacy-url]: https://www.codacy.com/app/greg_7/generator-apigee-apiproxy?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=gregswindle/generator-apigee-apiproxy&amp;utm_campaign=Badge_Grade
[code-of-conduct-url]: ./.github/CODE_OF_CONDUCT.md
[complexity-report-url]: https://github.com/escomplex/complexity-report
[coveralls-img]: https://coveralls.io/repos/github/gregswindle/generator-apigee-apiproxy/badge.svg?branch=master
[coveralls-url]: https://coveralls.io/github/gregswindle/generator-apigee-apiproxy?branch=master
[coveralls-url]: https://coveralls.io/r/gregswindle/generator-apigee-apiproxy
[daviddm-image]: https://david-dm.org/gregswindle/generator-apigee-apiproxy.svg?theme=shields.io
[daviddm-url]: https://david-dm.org/gregswindle/generator-apigee-apiproxy
[eslint-dev-env-url]: http://eslint.org/docs/developer-guide/development-environment
[greenkeeper-img]: https://badges.greenkeeper.io/gregswindle/generator-apigee-apiproxy.svg?style=flat-square
[greenkeeper-url]: https://greenkeeper.io/
[inch-ci-img]: http://inch-ci.org/github/gregswindle/generator-apigee-apiproxy.svg?branch=master
[inch-ci-url]: http://inch-ci.org/github/gregswindle/generator-apigee-apiproxy
[issues-new-url]: https://github.com/gregswindle/generator-apigee-apiproxy/issues/new
[issues-url]: https://github.com/gregswindle/generator-apigee-apiproxy/issues
[js-callout-docs-url]: ./docs/README.md
[jsdoc-url]: http://usejsdoc.org/
[jsdoc2md-url]: https://github.com/jsdoc2md/jsdoc-to-markdown
[license-image]: https://img.shields.io/badge/License-Apache%202.0-blue.svg?style=flat
[license-image]: https://img.shields.io/badge/License-Apache%202.0-blue.svg?style=flat
[license-url]: ./LICENSE
[makeapullrequest-image]: https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat
[makeapullrequest-url]: http://makeapullrequest.com
[npm-image]: https://badge.fury.io/js/generator-apigee-apiproxy.svg
[npm-url]: https://npmjs.org/package/generator-apigee-apiproxy
[nsp-img]: https://nodesecurity.io/orgs/gregswindle/projects/a3912719-529f-457f-9ff6-53fa70d8f475/badge
[nsp-url]: https://nodesecurity.io/orgs/gregswindle/projects/a3912719-529f-457f-9ff6-53fa70d8f475
[pr-url]: https://github.com/gregswindle/generator-apigee-apiproxy/pulls
[readme-score-img]: http://readme-score-api.herokuapp.com/score.svg?url=https://github.com/gregswindle/generator-apigee-apiproxy
[readme-score-url]: http://clayallsopp.github.io/readme-score?url=https://github.com/gregswindle/generator-apigee-apiproxy
[sonar-cognitive-img]: http://sonarcloud.io/api/badges/measure?key=gregswindle-generator-apigee-apiproxy&metric=cognitive_complexity
[sonar-cognitive-url]: https://sonarcloud.io/component_measures/metric/cognitive_complexity/list?id=gregswindle-generator-apigee-apiproxy
[sonar-complexity-img]: http://sonarcloud.io/api/badges/measure?key=gregswindle-generator-apigee-apiproxy&metric=function_complexity
[sonar-complexity-url]: https://sonarcloud.io/component_measures/domain/Complexity?id=gregswindle-generator-apigee-apiproxy
[sonar-coverage-img]: http://sonarcloud.io/api/badges/measure?key=gregswindle-generator-apigee-apiproxy&metric=coverage
[sonar-coverage-url]: https://sonarcloud.io/component_measures/domain/Coverage?id=gregswindle-generator-apigee-apiproxy
[sonar-gate-img]: http://sonarcloud.io/api/badges/gate?key=gregswindle-generator-apigee-apiproxy
[sonar-gate-url]: http://sonarcloud.io/dashboard/index/gregswindle-generator-apigee-apiproxy
[sonar-security-img]: http://sonarcloud.io/api/badges/measure?key=gregswindle-generator-apigee-apiproxy&metric=vulnerabilities
[sonar-security-url]: https://sonarcloud.io/component_measures/domain/Security?id=gregswindle-generator-apigee-apiproxy
[sonar-tech-debt-img]:  https://sonarcloud.io/api/badges/measure?key=gregswindle-generator-apigee-apiproxy&metric=sqale_debt_ratio
[sonar-tech-debt-url]: https://sonarcloud.io/component_measures/metric/sqale_index/list?id=gregswindle-generator-apigee-apiproxy
[stackshare-img]: https://img.shields.io/badge/tech-stack-0690fa.svg?style=flat
[stackshare-url]: https://stackshare.io/gregswindle/generator-apigee-apiproxy
[swagger-api-docs-url]: ./docs/SWAGGER.md
[swagger-cli-url]: https://github.com/BigstickCarpet/swagger-cli
[swagger-io-url]: http://swagger.io
[swagger-logo-20-img]: ./.assets/media/img/swagger-logo-20.png
[swagger-markdown-url]: https://github.com/syroegkin/swagger-markdown
[swagger-validity-img]: https://img.shields.io/swagger/valid/2.0/http/api.swindle.net/cordova/v6/contacts/openapi.json.svg
[swagger-validity-url]: http://online.swagger.io/validator/debug?url=http://api.swindle.net/cordova/v6/contacts/openapi.json
[travis-image]: https://travis-ci.org/gregswindle/generator-apigee-apiproxy.svg?branch=master
[travis-image]: https://travis-ci.org/gregswindle/generator-apigee-apiproxy.svg?branch=master
[travis-url]:  https://travis-ci.org/gregswindle/generator-apigee-apiproxy
[travis-url]: https://travis-ci.org/gregswindle/generator-apigee-apiproxy
