# Master's Thesis Latex Template [![Build Status](https://app.travis-ci.com/mas-group/project-report.svg?branch=master)](https://app.travis-ci.com/github/mas-group/project-report)

This template is designed for the R&D and master's thesis reports of the Autonomous Systems master's program at Hochschule Bonn-Rhein-Sieg. Based on the template created by Ronni Hartanto in 2003.

The template is configured to be printed two-sided by default; this can be changed to a supervisor's preference by passing the option `oneside` instead.

The logo of an external institution can be added with the command `\thirdpartylogo{path/to/image/}`

## Prerequisites

Please make sure that you have `texlive-full` installed so that you don't face any compilation errors (on Ubuntu systems, you can install it with `sudo apt install texlive-full`).

## Usage

The main file of the report is `report.tex`; chapters, appendices, and the abstract are given in separate files in the `chapters` directory.

When submitting a report, the name of the pdf should be changed to match the naming convention specified in the MAS Vital Information, namely

```
LastNameI-[RnD-MT]Report
```

Examples: For an R&D, John Doe would name his file `DoeJ-RnDReport.pdf`; for a thesis, John Doe would name the file `DoeJ-MTReport.pdf`.

If there are any problems, don't hesitate to let us know! You can open an issue [here](https://github.com/mas-group/project-report/issues/new).

## Note About Naming Your Chapters and Sections

The chapter and section names here are very generic since this is a template; however, feel free to modify them/make them more concrete based on your needs! In other words, the names in your report don't have to be the same as in the template (although you will want to keep at least the names of the introduction, state of the art, and conclusions chapters unchanged).
