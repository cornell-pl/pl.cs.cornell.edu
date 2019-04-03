Cornell PL WWW
-------------

Website for the Cornell Programming Languages group.


## Pre-requisites

The website is generate by the [Hugo][hugo] website generator and uses the
[Academic][academic] theme. The theme is stored as a submodule under
`themes/academic/`.

1. Recursively clone the repository:
   ```
   git clone --recurse-submodules https://github.com/cornell-pl/www.git
   ```
2. Install [Go][go] (ver >= 0.49.2) and [Hugo][hugo] (ver >= 1.11).

3. Run `hugo server -w` to generate the website locally.

4. Run the `./deploy.sh` script to commit all changes to the `docs/` folder.

[hugo]: https://gohugo.io/
[go]: https://golang.org/
[academic]: https://github.com/gcushen/hugo-academic


## Content Mangement

Most of the content is stored under `/content/home`.

- **about.md**: Content for the about widget.
- **news.md**: Latest news about the group. To add a new news item, use the
  format from the other items. Since the `[[news]]` list is order, make sure
  that the item is added to the top.
- **faculty.md**, **students.md**, **alumni.md**...: Content for various groups
  of members.


## Styling

The styling templates are stored under `layouts/`. Hugo uses a priority-based
override method for determining which template to use. By default, it uses
the template from `theme/academic/layouts` **unless** there is another template
of the same name (and directory structure) in `layout/`.

For example, if you want to override the styling in
`theme/academic/layout/foo/bar.html`, simply copy it to `layout/foo/bar.html`
and add your changes.

## Deployment

The test website is deployed using GitHub pages.

1. In the repository top level, clone the `master` branch in `public/`
```
git clone --branch master https://github.com/cornell-pl/cornell-pl.github.io.git public/
```

2. Run the following to generate a website with *committed* changes:
```
git stash && hugo && git stash pop
```

3. Deploy by pushing to `master` from the `public/` directory:
```
cd public/ && git push
```
