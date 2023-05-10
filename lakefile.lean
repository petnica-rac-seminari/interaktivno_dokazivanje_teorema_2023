import Lake
open Lake DSL

package «idt2023» {
  -- add any package configuration options here
}

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"

@[default_target]
lean_lib «Idt2023» {
  -- add any library configuration options here
}
