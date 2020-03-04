Cornell PL WWW
-------------

Website for the Cornell Programming Languages group.

The website is automatically deployed on each commit by [Hooknook](https://github.com/sampsyo/hooknook/).
Contact [Rachit][] or [Adrian][] if there are issues.

[adrian]: http://adriansampson.net
[rachit]: https://rachitnigam.com

## Pre-requisites

The website is generate by the [Hugo][hugo] website generator and uses the
[Academic][academic] theme. The theme is stored as a submodule under
`themes/academic/`.

1. Recursively clone the repository:
   ```
   git clone --recurse-submodules https://github.com/cornell-pl/pl.cs.cornell.edu.git
   ```
2. Install [Go][go] (ver >= 0.49.2) and [Hugo][hugo] (ver >= 1.11).

3. Run `hugo server -w` to generate the website locally.

[hugo]: https://gohugo.io/
[go]: https://golang.org/
[academic]: https://github.com/gcushen/hugo-academic

## Adding news items

In two easy steps!

1. Edit the [news file][news] using one of the formats.
2. If you don't have write access, create a pull request and tag @rachitnigam. If you do, just merge! The website automatically rebuilds and redeploys on each push.

[news]: https://github.com/cornell-pl/pl.cs.cornell.edu/edit/master/content/home/news.md

## PLDG

To create a new PLDG page type:

```
hugo new pldg/<semester>.md
```

where `<semester>` is of the form `2019fa`.

Next, edit the file generated in `content/pldg/<semester>.md` and update the
link in `config.toml` for `pldg` to point to the latest webpage.


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
