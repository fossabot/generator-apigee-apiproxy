# Contributing to `generator-apigee-apiproxy`

> Contributions are stories with a beginning, a middle, and an end, all told through JIRA issues and Git pull requests.

## 1. Table of contents
<!-- TOC depthFrom:2 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [1. Table of contents](#1-table-of-contents)
- [2. User Stories and sub-tasks](#2-user-stories-and-sub-tasks)
- [3. Topic branches](#3-topic-branches)
	- [3.1. Step-by-step instructions: create a topic branch](#31-step-by-step-instructions-create-a-topic-branch)
	- [3.2. Valid branch prefix names](#32-valid-branch-prefix-names)
- [4. Pull requests (PRs)](#4-pull-requests-prs)
- [5. `conventional commit messages` and change `types`](#5-conventional-commit-messages-and-change-types)
	- [5.1. `build` commit messages](#51-build-commit-messages)
	- [5.2. `chore` commit messages](#52-chore-commit-messages)
	- [5.3. `ci` commit messages](#53-ci-commit-messages)
	- [5.4. `docs` commit messages](#54-docs-commit-messages)
	- [5.5. `feat` (feature) commit messages](#55-feat-feature-commit-messages)
	- [5.6. `fix` commit messages](#56-fix-commit-messages)
	- [5.7. `perf` (performance) commit messages](#57-perf-performance-commit-messages)
	- [5.8. `refactor` commit messages](#58-refactor-commit-messages)
	- [5.9. `revert` commit messages](#59-revert-commit-messages)
	- [5.10. `style` commit messages](#510-style-commit-messages)
	- [5.11. `test` commit messages](#511-test-commit-messages)
- [6. Development](#6-development)
	- [6.1. Code standards](#61-code-standards)
	- [6.2. Testing](#62-testing)

<!-- /TOC -->

## 2. User Stories and sub-tasks

> Assign yourself an open User Story or sub-task from the [JIRA Developer Portal Epic][jira-dp-epic-url] to begin collaboration.

Contributions start with clear communication, and issues – not e-mails! – are the best way to collaborate with colleagues.

Besides, whenever you save a comment or an edit to an issue, the right stakeholders will be notified.

## 3. Topic branches
> Use JIRA User Stories and sub-tasks to create topic branches.

### 3.1. Step-by-step instructions: create a topic branch

We use "topic" branches to allow for parallel product development. Once you've committed to working on a User Story (or one of its sub-tasks), follow these steps.

> **Prerequisite development software required**
>
> Before following these steps, make to [Install prerequisite software for Apigee Developer Portal development](https://oneconfluence.verizon.com/x/qe1SDQ), first.

3.1.1. Open the JIRA User Story (or sub-task) in a Web browser.

3.1.2. In the right navigation page, select "Development: Create branch":

![Create a new topic branch from a JIRA issue][readme-jira-issue-create-branch-image]

3.1.3. Select the correct Git repository and topic based on the type of issue you're addressing:

![Create new branch dialog][readme-bitbucket-create-branch-image]

3.1.4. Clone the repository to your workstation (if you haven't already):

```sh

$ git clone ssh://git@onestash.verizon.com:7999/gtsap/generator-apigee-apiproxy.git

```

3.1.5. Install quality checking dependencies:

```sh

$ npm install

```

3.1.6. Fetch all branches:

```sh

$ git fetch --all

```

3.1.7. Checkout out your new topic branch

```sh

$ git checkout feature/ONEAPI-135-api-summary-section

```

3.1.8. Open your IDE and get to work! :)

3.1.9. Commit and push your changes:

```sh

$ git add .
$ git commit -m "feat(api-summary): show latest api version

ONEAPI-135"

$ git push origin feature/ONEAPI-135-api-summary-section

```

### 3.2. Valid branch prefix names
> Topic branches must start with either one of the conventional commit types or a valid Bitbucket branch prefix.

The following branch prefixes are allowed.

* `bugfix/`
    * **Example**: bugfix/ONEAPI-330-setup-scm
    * **Regular expression**: `^bugfix\/(.*){1,255}$`
* `build/`
    * **Example**: build/ONEAPI-330-setup-scm
    * **Regular expression**: `^build\/(.*){1,255}$`
* `chore/`
    * **Example**: chore/ONEAPI-330-setup-scm
    * **Regular expression**: `^chore\/(.*){1,255}$`
* `ci/`
    * **Example**: ci/ONEAPI-330-setup-scm
    * **Regular expression**: `^ci\/(.*){1,255}$`
* `docs/`
    * **Example**: docs/ONEAPI-330-setup-scm
    * **Regular expression**: `^docs\/(.*){1,255}$`
* `feat/`
    * **Example**: feat/ONEAPI-330-setup-scm
    * **Regular expression**: `^feat\/(.*){1,255}$`
* `feature/`
    * **Example**: feature/ONEAPI-330-setup-scm
    * **Regular expression**: `^feature\/(.*){1,255}$`
* `fix/`
    * **Example**: fix/ONEAPI-330-setup-scm
    * **Regular expression**: `^fix\/(.*){1,255}$`
* `hotfix/`
    * **Example**: hotfix/ONEAPI-330-setup-scm
    * **Regular expression**: `^hotfix\/(.*){1,255}$`
* `perf/`
    * **Example**: perf/ONEAPI-330-setup-scm
    * **Regular expression**: `^perf\/(.*){1,255}$`
* `refactor/`
    * **Example**: refactor/ONEAPI-330-setup-scm
    * **Regular expression**: `^refactor\/(.*){1,255}$`
* `revert/`
    * **Example**: revert/ONEAPI-330-setup-scm
    * **Regular expression**: `^revert\/(.*){1,255}$`
* `spike/`
    * **Example**: spike/ONEAPI-330-setup-scm
    * **Regular expression**: `^spike\/(.*){1,255}$`
* `style/`
    * **Example**: style/ONEAPI-330-setup-scm
    * **Regular expression**: `^style\/(.*){1,255}$`
* `test/`
    * **Example**: test/ONEAPI-330-setup-scm
    * **Regular expression**: `^test\/(.*){1,255}$`

> Not sure whether your branch name will be rejected? [Test your branch name][branch-name-test-url] against the regular expressions below in a Web browser.

## 4. Pull requests (PRs)

> Submit a pull request (PR) immediately after your first push to `origin`.

4.1. Open Bitbucket in a Web browser:

https://onestash.verizon.com/projects/GTSAP/repos/generator-apigee-apiproxy/browse

4.2. Select your topic branch.

4.3. Select "Pull requests" where

* **SOURCE** is your topic branch, and
* **DESTINATION** is `develop`.

Select the Continue button.

![Bitbucket pull request dialog][readme-bitbucket-create-pr-image]

4.4. Give your pull request a

* Title
* Description
* Reviewers (add at least two members from the core team)

![Bitbucket pull request inputs][readme-bitbucket-create-pr-inputs-image]

Now all pushes to your topic branch will appear in your pull request.

## 5. `conventional commit messages` and change `types`
> This project enforces _[AngularJS Git Commit Guidelines][git-commit-guidelines-url]_ (aka [`conventional commit messages`][git-commit-guidelines-url]) with [`commitplease`][commitplease-url] pre-commit hooks.
>
> This not only results in consistent, legible Git logs, but also enables automated CHANGELOG generation and semantic versioning with [`standard-version`][standard-version-url]; read the how-to [Automate CHANGELOGs and semantic versioning](https://oneconfluence.verizon.com/x/SnMnDg) for details.

### 5.1. `build` commit messages

Issues related to product builds. The AngularJS Git commit message format is

```

build(<scope>): <subject>
<BLANK LINE>
<[body]>
<BLANK LINE>
<footer>
```

### 5.2. `chore` commit messages

Issues related to miscellaneous non-functional changes (usually "maintenance" changes). The AngularJS Git commit message format is

```

chore(<scope>): <subject>
<BLANK LINE>
<[body]>
<BLANK LINE>
<footer>
```

### 5.3. `ci` commit messages

Issues related to continuous integration, delivery, and deployment tasks. The AngularJS Git commit message format is

```

ci(<scope>): <subject>
<BLANK LINE>
<[body]>
<BLANK LINE>
<footer>
```

### 5.4. `docs` commit messages

Issues related to documentation. The AngularJS Git commit message format is

```

docs(<scope>): <subject>
<BLANK LINE>
<[body]>
<BLANK LINE>
<footer>
```

### 5.5. `feat` (feature) commit messages

New feature or enhancement requests. The AngularJS Git commit message format is

```

feat(<scope>): <subject>
<BLANK LINE>
<[body]>
<BLANK LINE>
<footer>
```

### 5.6. `fix` commit messages

Defect (bug) repair issues. The AngularJS Git commit message format is

```

fix(<scope>): <subject>
<BLANK LINE>
<[body]>
<BLANK LINE>
<footer>
```

### 5.7. `perf` (performance) commit messages

Performance improvement issues. The AngularJS Git commit message format is

```

perf(<scope>): <subject>
<BLANK LINE>
<[body]>
<BLANK LINE>
<footer>
```

### 5.8. `refactor` commit messages

Source code design **improvements that do not affect product behavior**. The AngularJS Git commit message format is

```

refactor(<scope>): <subject>
<BLANK LINE>
<[body]>
<BLANK LINE>
<footer>
```

### 5.9. `revert` commit messages

Tasks that revert to a previous commit hash. Your message should begin with `revert:`, followed by the header of the reverted commit.

In the body it should say: `This reverts commit <hash>.`, where the hash is the SHA of the commit being reverted.

```

revert: <hash>
<BLANK LINE>
This reverts commit <hash>.
<BLANK LINE>
<footer>
```

### 5.10. `style` commit messages

Issues related to style guideline compliance, especially `PHP_CodeSniffer` errors and warnings. The AngularJS Git commit message format is

```

style(<scope>): <subject>
<BLANK LINE>
<[body]>
<BLANK LINE>
<footer>
```

### 5.11. `test` commit messages

Test coverage tasks. The AngularJS Git commit message format is

```

test(<scope>): <subject>
<BLANK LINE>
<[body]>
<BLANK LINE>
<footer>
```

## 6. Development
> The OneAPI Developer Portal will be the virtual home of Verizon's internal API community, as well as the e-commerce and consumption store for external customers.
>
> It is therefore crucial to follow strong engineering standards to assure quality and performance.

### 6.1. Code standards

* **[Drupal Coding Standards](https://www.drupal.org/docs/develop/standards)**: The source code for this project should follow Drupal Coding Standards.
* **[`PHP_CodeSniffer`][php-codesniffer-url]**: We will add `PHP_CodeSniffer` to automatically [lint our source code][lint-software-url] during Sprint 0.

### 6.2. Testing

> Write specs (i.e., unit tests). Behavior-driven development specifications are executable documentation. By the way, 100% code coverage is the norm, not the exception.

We will add the [`behat`][behat-url] framework for [Behavior-Driven Development (BDD)][bdd-url]  specs (née unit tests) during Sprint 0.

Thank you for contributing, and welcome to the community!

---

2017, [Greg Swindle](mailto:gregory.jay.swindle@verizon.com).

[bdd-url]: https://en.wikipedia.org/wiki/Behavior-driven_development
[behat-url]: http://behat.org/en/latest/
[branch-name-test-url]: https://regex101.com/
[commitplease-url]: https://www.npmjs.com/package/commitplease
[git-commit-guidelines-url]: https://github.com/angular/angular.js/blob/master/CONTRIBUTING.md#commit
[jira-dp-epic-url]: https://onejira.verizon.com/secure/RapidBoard.jspa?rapidView=46863&projectKey=ONEAPI&view=planning.nodetail&selectedEpic=ONEAPI-120
[label-status-available-url]: ../labels/Status%3A%20Available
[lint-software-url]: https://en.wikipedia.org/wiki/Lint_(software)
[new-issue-url]: https://oneconfluence.verizon.com/x/So_PCw
[php-codesniffer-url]: https://github.com/squizlabs/PHP_CodeSniffer
[readme-jira-issue-create-branch-image]: ./assets/img/readme-jira-issue-create-branch.png
[readme-bitbucket-create-branch-image]: ./assets/img/readme-bitbucket-create-branch.png
[readme-bitbucket-create-pr-image]: ./assets/img/readme-bitbucket-create-pr-inputs.png
[readme-bitbucket-create-pr-inputs-image]: ./assets/img/readme-bitbucket-create-pr.png
[readme-jira-issue-select-repo-topic-image]: ./assets/img/readme-jira-issue-select-repo-topic.png
[standard-version-url]: https://github.com/conventional-changelog/standard-version
