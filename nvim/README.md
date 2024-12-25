- list run time paths

## Todos
- [Tailswind Set Up](https://www.youtube.com/watch?v=_NiWhZeR-MY&t=43s)
- [Build a Plugin](https://vineeth.io/posts/neovim-setup)

## Dev
- https://github.com/rockerBOO/awesome-neovim?tab=readme-ov-file#neovim-lua-development

`echo nvim_list_runtime_paths()`

## Cmp
`:h ins-completion`

## Quick Fix
- `:copen` `:close`
- `:cnext` `cprev`
- `:cdo`

## Diagnostics
`:h vim.diagnostic`

## Spell
To use spell checking in Vim:  

1. **Enable spell checking**:  
   `:set spell`  

2. **Turn off spell checking**:  
   `:set nospell`  

3. **Move to the next misspelled word**:  
   `]s`  

4. **Move to the previous misspelled word**:  
   `[s`  

5. **Correct a misspelled word**:  
   - Place the cursor on the misspelled word.  
   - Press `z=` to see a list of suggestions.  
   - Type the number corresponding to the correct suggestion and press Enter.  

6. **Add a word to the dictionary** (so it is no longer marked as misspelled):  
   `zg`  

7. **Mark a word as incorrect**:  
   `zw`  

8. **Set a specific language for spell checking** (e.g., English):  
   `:set spelllang=en`  

Let me know if you'd like further explanation on any of these!
