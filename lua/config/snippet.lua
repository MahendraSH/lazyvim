-- Import LuaSnip
local ls = require("luasnip")

-- Define the LuaSnip snippet
local fc_snippet = ls.parser.parse_snippet({
  -- Triggered by "crfc" followed by a space
  trig = "crfc",
  name = "TypeScript React Function Component",
  -- The body of the snippet
  wordTrig = false, -- Treat the trigger as a whole word
  body = [[
import { FC } from 'react'

interface ${1:TM_FILENAME_BASE}Props {
  $2
}

const ${3:TM_FILENAME_BASE}: FC<${3:TM_FILENAME_BASE}Props> = ({$4}) => {
  return (
    <div>
      {/* Your component content here */}
    </div>
  )
}

export default ${3:TM_FILENAME_BASE}
]],
  -- Placeholder for props
  ls.parser.parse_snippet({ 2 }, "/* Add your props here */"),
  -- Placeholder for destructuring
  ls.parser.parse_snippet({ 3 }, "..."),
})

-- Add the snippet to the appropriate snippet manager
ls.snippets = {
  typescriptreact = {
    fc_snippet,
  },
}

-- Add the snippet to files with the .tsx extension
require("luasnip.snips").add_snippet("crfc", "TypeScript React Function Component", { ".tsx" }, fc_snippet.body)
