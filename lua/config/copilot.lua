-- Copilot Chat prompts configuration
local prompts = {
  -- Code related prompts
  ExplainCode = "Please explain how this following code works:",
  Review = "Please review this code and provide feedback for improvement:",
  Tests = "Please explain how the selected code works, and write a unit test for it:",
  Refactor = "Please refactor this code to improve readability and maintainability:",
  FixCode = "Please fix the following code and explain the changes you made:",
  FixError = "Please explain the error in this code and provide a corrected version:",
  FixBug = "Please identify and fix the bug in this code, and explain your solution:",
  BestPractices = "Please analyze this code and suggest improvements based on best practices:",
  BetterCode = "Please suggest a better implementation for this code and explain why it's better:",
  BetterVariableNames = "Please suggest better variable names for this code and explain your choices:",
  Documentation = "Please generate documentation for this code, including function descriptions and usage examples:",
  SwaggerApiDocs = "Please generate Swagger API documentation for this code, including endpoint descriptions and request/response examples:",
  SwaggerJsDocs = "Please generate Swagger JS documentation for this code, including endpoint descriptions and request/response examples:",
  -- Text related prompts
  SummarizeText = "Please summarize the following text:",
  SpellCheck = "Please check the spelling and grammar of this text and suggest corrections:",
  Wording = "Please suggest better wording for this text and explain your choices:",
  Concise = "Please make this text more concise while retaining its meaning:",
}

local opts = {
  question_header = "## User",
  answer_header = "## Copilot",
  error_header = "## Error",
  prompts = prompts,
  mappings = {
    -- Use tab for completion and navigate to the next placeholder
    complete = {
      detail = "Use @<Tab> or /<Tab> for completion",
      insert = "<Tab>",
    },
    -- Close the chat
    close = {
      normal = "q",
      insert = "<C-c>",
    },
    -- Reset the chat buffer
    reset = {
      normal = "<C-x>",
      insert = "<C-x>",
    },
    -- Submit the prompt
    submit_prompt = {
      normal = "<CR>",
      insert = "<C-CR>",
    },
    -- Accept the diff
    accept_diff = {
      normal = "<C-y>",
      insert = "<C-y>",
    },
    -- Show help
    show_help = {
      normal = "g?",
    },
  },
}

-- Which-key spec untuk groups
local which_key_spec = {
  { "<leader>a", group = "copilot", icon = "󰚀" },
  { "<leader>gm", group = "Copilot Chat" },
}

return {
  prompts = prompts,
  opts = opts,
  which_key_spec = which_key_spec,
}