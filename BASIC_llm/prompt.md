# Prompting Cheat Sheet for ChatGPT & Perplexity

## Key Principles for Effective Prompts

- **Clarity & Specificity:** Be specific about what you want. Vague prompts yield vague answers.
- **Context:** Provide background or define roles to guide responses.
- **Explicit Instructions:** Specify format, tone, length, and style.
- **Iterative Refinement:** Start simple, then add detail or ask for improvement.
- **Role-Playing / Perspective:** Assign the AI a role or persona to narrow its focus.
- **Micro-Tasks Over Megatasks:** Break complex requests into smaller steps or parts.
- **Creative Constraints:** Adding creativity prompts (e.g., style, humor) sharpens output.

---

## Basic Prompt Formula


Act as [role/persona] + Do [task] + In [format/style/length]

---

## Examples of Effective Prompts

- **Role-based prompt:**
  - Act as a career coach and help me prepare for an interview.
  - Assume the role of a teacher. Explain photosynthesis with examples.

- **Specific requests:**
  - Give me 10 creative marketing ideas for a bakery in a small mountain town.
  - Summarize the latest research on renewable energy in 5 sentences with 3 actionable takeaways.

- **Format and tone:**
  - Write a 200-word blog post on time management in a friendly tone.
  - List pros and cons of electric vehicles in a table format.

- **Step-by-step guides:**
  - Describe the process of baking a cake step-by-step.
  - Create a revision plan to help pass a history test in two weeks.

- **Iterative refinement:**
  - Make this explanation more succinct but keep the crucial points.
  - Rewrite this paragraph to sound more engaging and include anecdotes.

- **Creative & unusual:**
  - Write a story in the style of Raymond Chandler about why my marketing campaign will fail.
  - You’re a brutally honest editor. Roast my draft and suggest improvements with wit.

---

## Advanced Techniques

- **Tree of Thought Exploration:**
  - Ask for multiple solutions/approaches to a problem, evaluate and pick the best.
  - Example: Explore three different ways to solve job displacement by AI. Rate each and recommend the best with justification.

- **Iterative conversation:**
  - Engage in back-and-forth by asking the AI to ask clarifying questions.
  - Example: Act as an interviewer for a project manager role. Ask me questions one by one.

---

## Using Speaker Tags in Prompts (`\human`, `\bot`, etc.)

- These tags are **speaker role labels** that help distinguish who is speaking in a conversation.
- Common in chatbot training, testing, or scripted multi-turn dialogues to clarify user vs. AI turns.
- **Example usage:**


\human: How do I improve my resume?
\bot: Here are some tips to improve your resume effectively...

- **Benefits:**
- Helps maintain context in multi-turn conversations.
- Simulates dialogue flow clearly.
- Useful in platforms or APIs that support or recognize these tags.
- **Caveats:**
- Not all LLM interfaces (like standard ChatGPT or Perplexity) inherently recognize these tokens.
- Best used alongside explicit instructions for interpretation.
- **Explicit instruction tip:**  
For this conversation, my inputs will be prefixed with `\human:` and please prefix your responses with `\bot:`.
- Speaker tags are handy for role-play, debugging, or structuring complex chats.

---

## Common Mistakes to Avoid

- Overloading with too much detail initially—start simple and build up.
- Leaving out important context or audience details.
- Asking for generic outputs without specific direction.
- Neglecting to specify format or tone when needed.

---

## Quick Prompt Starters

- Explain like I’m five...
- List 5 reasons why...
- Compare A and B, highlighting pros and cons.
- Generate a checklist for...
- Suggest improvements for this text: [insert text].
- Translate this into [language].
- Summarize [topic] succinctly for [audience].

---

This cheat sheet structures better prompts for more useful, creative, and accurate outputs from ChatGPT, Perplexity, or any other LLM.
