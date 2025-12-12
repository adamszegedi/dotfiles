# study stream aliases
# Requires https://github.com/caarlos0/timer to be installed. spd-say should ship with your distro

declare -A pomo_options
pomo_options["work"]="25"
pomo_options["break"]="10"
pomo_options["rest"]="30"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
      (
          set -e
          val=$1
          echo $val
          timer ${pomo_options["$val"]}m
          curl \
              -H "Title: Pomodoro" \
              -H "Tags: tomato" \
              -d "'$val' session done" \
              ntfy.sh/Extradite-Barrier-Elevator-Primer-Slider8-Passion
      )
  fi
}
