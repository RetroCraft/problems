# Pain and Agony: A Collection of CS/BBA Problems and Exercises

This is an [open archive](https://agony.retrocraft.ca) of practice problems
from my classes in the Waterloo/Laurier CS/BBA program. Some of them cause quite the pain and agony.
These are published with the belief that they are permitted by relevant faculty,
please [contact me](mailto:jahyong@uwaterloo.ca) if they are not and I will take them down.

These were originally published alongside my personal assignments
([link](https://retrocraft.github.io/assignments)),
but I figured it may be helpful to make this open to contributions as well.

Feel free to make a pull request for anything you think would be relevant!
I make a lot of mistakes, after all.

## Contributing

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/retrocraft/problems)

The easiest way to contribute is to use GitPod,
which will automatically create a development environment
with LaTeX installed and all the setup necessary.

Otherwise, keep in mind that:

- You _should_ be a student in the relevant class to contribute,
  since you should not otherwise have access to course content.
- LaTeX macros used in multiple files are placed in the `latex` folder. Make sure it's on the path.
  - You can do this by setting `TEXINPUTS`. If using VS Code, this is automatically done for you in `./.vscode/settings.json`.
- Some packages used (notably for code highlighting) require `-shell-escape`.
- Formatting is done with `latexindent`. I'm not a huge stickler for indentation.
- PDF files are added to the repository so they may be served by GitHub Pages.
- Since this was forked and redacted (Policy 71!), the commit history is a bit messy. Sorry.

## Using the `agony` class

The [`agony` class](./latex/agony.cls) has built up naturally over the course of my undergrad.
It is not by any means well-organized.
I've made a recent push to extract out course-specific macros and packages
to special `agony-[course code].tex` files which are dynamically included.
For now, the class supports the following parameters:

- `course=[course code]`: Loads the macros in `./latex/agony-[course code].tex`
- `tikz`: Loads `tikzpicture` and related packages
- `notes`: Loads [`agony-note.tex`](./latex/agony-note.tex), which (among other things) is based on `report.cls` instead of `article.cls`

Generally, the way I use the class (for an assignment) will look like:

```latex
\documentclass[class=math239]{agony}

\title{MATH 239 Fall 2022: Assignment X}
\begin{document}

\begin{prob}
  (5 marks) Problem 1
\end{prob}
\begin{sol}
  Solution to problem 1.
\end{sol}

\begin{prob}
  (15 marks) Prove the following statements.
\end{prob}
\begin{enumerate}
  \item (10 marks) Part (a) statement.
        \begin{prf}
          Proof of problem 2(a).
        \end{prf}
  \item (5 marks) Part (b) statement.
        \begin{prf}
          Proof of problem 2(b).
        \end{prf}
\end{enumerate}

\end{document}
```
