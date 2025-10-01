for file in CSSPure.mint CrystalPure.mint GoPure.mint HAMLPure.mint HTMLPure.mint HTTPPure.mint JSONPure.mint JavaScriptPure.mint MintPure.mint PythonPure.mint StimulusPure.mint TypeScriptPure.mint; do
  funcname=$(grep "fun highlight" "$file" | sed 's/.*fun \(highlight[^ ]*\).*/\1/')
  sed -i "/fun $funcname/,/^  }$/{ 
    s/fun $funcname (line : String) : String {$/fun $funcname (line : String) : String {\n    let config =\n      getConfig\n/
    s/HighlightEngine.highlight(line, getConfig)/HighlightEngine.highlight(\n      line,\n      config.keywords,\n      config.types,\n      config.booleans,\n      config.singleLineComment,\n      config.multiLineCommentStart,\n      config.multiLineCommentEnd,\n      config.stringDelimiters)/
  }" "$file"
done
