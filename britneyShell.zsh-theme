
ZSH_THEME_GIT_PROMPT_PREFIX="(%F{red}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{blue}) "
ZSH_THEME_GIT_PROMPT_CLEAN=" ✨"
ZSH_THEME_GIT_PROMPT_DIRTY=" 👹"

precmd() {
	EXIT_STATUS=$?
}

directory() {
	if [[ "$PWD" == "$HOME" ]]; then
		echo "%B%F{cyan}~%b%F{white}";
	else
		echo "%B%F{cyan}${PWD/#$HOME\//~/}%b%F{white}";
	fi
}

username() {
	echo "👸 %B%F{magenta}britney spears%F{white}%b 💅"
}

git_prompt_info() {
  local branch
  if command git rev-parse --is-inside-work-tree &>/dev/null; then
    branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
      echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${branch}${ZSH_THEME_GIT_PROMPT_DIRTY}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
    else
      echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${branch}${ZSH_THEME_GIT_PROMPT_CLEAN}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
    fi
  fi
}

ft_git() {
	echo "%B%F{blue}$(git_prompt_info)%b%F{white}"
}

message() {
	echo "femme au volant mort au tournant    "
}

ft_prompt() {
	echo -n "%B%F{yellow}$EXIT_STATUS%F{white}%b $(username) $(directory) $(ft_git)"
}

PROMPT='$(ft_prompt)
'

