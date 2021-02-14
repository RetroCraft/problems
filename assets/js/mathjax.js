window.MathJax = {
  startup: {
    ready() {
      // Configuration here taken from mathjax/MathJax#2313

      const Configuration = MathJax._.input.tex.Configuration.Configuration;
      const CommandMap = MathJax._.input.tex.SymbolMap.CommandMap;
      const Macro = MathJax._.input.tex.Symbol.Macro;
      const TexError = MathJax._.input.tex.TexError.default;
      const ParseUtil = MathJax._.input.tex.ParseUtil.default;
      const expandable = MathJax._.util.Options.expandable;
      const PAIREDMAP = 'pairedDelimitersMap';

      const PairedDelimiters = (parser, name, left, right) => {
        //  Get the macro parameters
        const star = parser.GetStar(); // true if there is a *
        const big = parser.GetBrackets(name); // contents of optional brackets
        const math = parser.GetArgument(name); // the math to go inside the delimiters

        // Construct the replacement string for the macro
        const macro = [
          star ? '\\left' : '',
          big ? big + 'l' : '',
          left,
          '{',
          math,
          '}',
          star ? '\\right' : '',
          big ? big + 'r' : '',
          right,
        ].join('');

        // Insert the replacement string into the TeX string, and check
        // that there haven't been too many maxro substitutions (prevent's
        // infinite loops).
        parser.string = ParseUtil.addArgs(parser, macro, parser.string.slice(parser.i));
        parser.i = 0;
        if (++parser.macroCount > parser.configuration.options.maxMacros) {
          throw new TexError(
            'MaxMacroSub1',
            'MathJax maximum macro substitution count exceeded; ' +
              'is there a recursive macro call?',
          );
        }
      };

      Configuration.create('pairedDelimiters', {
        // Initialize the extension by creating the command map for the
        // macros defined by \DeclarePairedDelimiter, and add the
        // \DeclarePairedDelimiter macro itself.  Then append the
        // command map to the given configuration as a macro handler
        init(config) {
          const map = new CommandMap(
            PAIREDMAP,
            {
              DeclarePairedDelimiter: ['Declare_PairedDelimiter'],
            },
            {
              Declare_PairedDelimiter(parser, name) {
                let cs = ParseUtil.trimSpaces(parser.GetArgument(name));
                const left = parser.GetArgument(name);
                const right = parser.GetArgument(name);
                if (cs.charAt(0) === '\\') cs = cs.substr(1);
                if (!cs.match(/^(.|[a-z]+)$/i)) {
                  throw new TexError(
                    'IllegalControlSequenceName',
                    'Illegal control sequence name for %1',
                    name,
                  );
                }

                const map = parser.configuration.handlers.retrieve(PAIREDMAP);
                map.add(cs, new Macro(cs, PairedDelimiters, [left, right]));
              },
            },
          );
          config.append(
            Configuration.create('pairedDelimiterDefs', { handler: { macro: [PAIREDMAP] } }),
          );
        },

        // Add any user-defined paired delimiters (from the
        // pairedDelimiters configuration object in the document's
        // option list, if any).
        config(config, jax) {
          const map = jax.parseOptions.handlers.retrieve(PAIREDMAP);
          const delimiters = jax.parseOptions.options.pairedDelimiters;
          for (const cs of Object.keys(delimiters)) {
            map.add(cs, new Macro(cs, PairedDelimiters, delimiters[cs]));
          }
        },

        //
        //  Indicate that pairedDelimiters is a valid option, and can have
        //  any number of definitions.  The format is
        //
        //      name: [left, right]
        //
        //  where 'name' is the macro name, and left and right are the
        //  delimiters to use for the \name macro.  You can include
        //  pre-defined macros here, which will be available without
        //  further configuration.
        //
        options: {
          pairedDelimiters: expandable({}),
        },
      });

      MathJax.startup.defaultReady();
    },
  },
  loader: { load: ['[tex]/ams', '[tex]/mhchem', '[tex]/physics'] },
  tex: {
    packages: { '[+]': ['pairedDelimiters', 'ams', 'mhchem', 'physics'] },
    macros: {
      sym: '\\mathbin{\\triangle}',
      // sets
      N: '\\mathbb{N}',
      Z: '\\mathbb{Z}',
      Q: '\\mathbb{Q}',
      R: '\\mathbb{R}',
      C: '\\mathbb{C}',
      F: '\\mathbb{F}',
      U: '\\mathcal{U}',
      // operators
      sgn: '\\operatorname{sgn}',
      im: '\\operatorname{im}',
      lcm: '\\operatorname{lcm}',
      cis: '\\operatorname{cis}',
      // calculus
      dyx: '\\dv{y}{x}',
      dlim: ['\\lim\\limits_{#1\\to#2}', 2],
      dilim: ['\\dlim{#1}{\\infty}', 1],
      ilim: ['\\lim_{#1\\to\\infty}', 1],
      at: ['\\left.#1\\right|_{#2}', 2],
      // linalg
      xto: '\\xrightarrow',
      harr: '\\leftrightarrow',
      ip: ['\\ev{#1,\\,#2}', 2],
      Proj: '\\operatorname{Proj}',
      Perp: '\\operatorname{Perp}',
      Span: '\\operatorname{Span}',
      REF: '\\operatorname{REF}',
      RREF: '\\operatorname{RREF}',
      nullity: '\\operatorname{nullity}',
      Col: '\\operatorname{Col}',
      O: '\\mathbb{O}',
      amat: ['\\left(\\begin{array}{#1}#2\\end{array}\\right)', 2],
    },
    pairedDelimiters: {
      abs: ['\\lvert', '\\rvert'],
      ceil: ['\\lceil', '\\rceil'],
      floor: ['\\lfloor', '\\rfloor'],
    },
  },
};
